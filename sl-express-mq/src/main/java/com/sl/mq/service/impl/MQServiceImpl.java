package com.sl.mq.service.impl;

import cn.hutool.core.exceptions.ExceptionUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONUtil;
import com.sl.mq.entity.FailMsgEntity;
import com.sl.mq.exception.MsgException;
import com.sl.mq.repository.FailMsgRepository;
import com.sl.mq.service.MQService;
import com.sl.transport.common.constant.MQ;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.AmqpException;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageBuilder;
import org.springframework.amqp.core.MessageDeliveryMode;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.retry.annotation.Backoff;
import org.springframework.retry.annotation.Recover;
import org.springframework.retry.annotation.Retryable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.nio.charset.StandardCharsets;

/**
 * @author wjlong1128
 * @since 1.0
 */
@Slf4j
@ConditionalOnProperty(prefix = "sl.mq", value = "enable")
@Service
public class MQServiceImpl implements MQService {

    @Resource
    private RabbitTemplate rabbitTemplate;

    @Resource
    private FailMsgRepository failMsgRepository;

    @Retryable(value = MsgException.class, maxAttempts = 3, backoff = @Backoff(value = 3000, multiplier = 1.5))
    @Override
    public Boolean sendMsg(String exchange, String routingKey, Object msg) {
        return this.sendMsg(exchange, routingKey, msg, MQ.DEFAULT_DELAY);
    }

    @Retryable(value = MsgException.class, maxAttempts = 3, backoff = @Backoff(value = 3000, multiplier = 1.5))
    @Override
    public Boolean sendMsg(String exchange, String routingKey, Object msg, int delay) {
        // 获取序列化消息, 消息id
        String jsonMsg = (msg instanceof String) ? (String) msg : JSONUtil.toJsonStr(msg);
        String msgId = IdUtil.simpleUUID();
        log.info("消息发送, exchange = {}, routingKey = {}, msg = {}, msgId = {}", exchange, routingKey, jsonMsg, msgId);
        CorrelationData correlationData = new CorrelationData(msgId);
        // 设置消息发送到交换机的回执
        correlationData.getFuture().addCallback(
                result -> {
                    if (result.isAck()) {
                        log.debug("消息发送成功, msgId:{}", correlationData.getId());
                        return;
                    }
                    log.error("消息发送失败, msgId:{}, reason:{}", correlationData.getId(), result.getReason());
                    FailMsgEntity failMsg = FailMsgEntity.builder()
                            .exchange(exchange)
                            .msgId(correlationData.getId())
                            .msg(jsonMsg)
                            .reason(result.getReason())
                            .build();
                    this.failMsgRepository.save(failMsg);
                },
                ex -> {
                    String exInfo = ExceptionUtil.getMessage(ex);
                    log.error("消息发送异常, msgId:{}, reason:{}", correlationData.getId(), exInfo);
                    FailMsgEntity failMsg = FailMsgEntity.builder()
                            .exchange(exchange)
                            .msgId(correlationData.getId())
                            .msg(jsonMsg)
                            .reason(exInfo)
                            .build();
                    this.failMsgRepository.save(failMsg);
                }
        );
        // 构造消息对象
        Message message = MessageBuilder.withBody(StrUtil.bytes(jsonMsg, StandardCharsets.UTF_8))
                // 设置持久化
                .setDeliveryMode(MessageDeliveryMode.PERSISTENT)
                .build();

        try {
            this.rabbitTemplate.convertAndSend(exchange, routingKey, message, postProcess -> {
                // 设置延迟时间
                postProcess.getMessageProperties().setDelay(delay);
                return postProcess;
            }, correlationData);
        } catch (AmqpException e) {
            // 转化为自定义异常，触发重试机制
            throw MsgException.builder()
                    .failMsgEntity(FailMsgEntity.builder()
                            .exchange(exchange)
                            .msgId(correlationData.getId())
                            .msg(jsonMsg)
                            .reason(ExceptionUtil.getMessage(e))
                            .build())
                    .build();
        }
        return true;
    }

    /**
     * 3次失败后 存入数据库
     *
     * @param msgException 失败消息
     */
    @Recover
    public Boolean saveFailMag(MsgException msgException) {
        // 发送消息失败，需要将消息持久化到数据库，通过任务调度的方式处理失败的消息
        this.failMsgRepository.save(msgException.getFailMsgEntity());
        return true;
    }
}

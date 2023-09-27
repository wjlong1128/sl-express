package com.sl.mq.config;

import cn.hutool.core.util.StrUtil;
import com.sl.transport.common.constant.MQ;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Configuration;

/**
 * 对消息进行配置
 *
 * @author wjlong1128
 * @since 1.0
 */
@Slf4j
@Configuration
public class MessageConfig implements ApplicationContextAware {

    /**
     * 设置发送者回执，没有到达队列的情况
     *
     * @param applicationContext
     * @throws BeansException
     */
    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        RabbitTemplate template = applicationContext.getBean(RabbitTemplate.class);
        // 消息到达队列的配置
        template.setReturnsCallback(message -> {
            if (StrUtil.contains(message.getExchange(), MQ.DELAYED_KEYWORD)) {
                // 延迟消息没有到达队列是正常的，无需记录日志
                return;
            }
            log.error("消息未成功投递到队列; 应答码:{}, 原因:{}, 交换机:{}, 路由键:{}, 消息:{}",
                    message.getReplyCode(), message.getReplyText(), message.getExchange(), message.getRoutingKey(), message.getMessage());
        });
    }

}

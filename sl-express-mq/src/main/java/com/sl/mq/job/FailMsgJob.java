package com.sl.mq.job;

import cn.hutool.core.collection.CollUtil;
import com.sl.mq.entity.FailMsgEntity;
import com.sl.mq.repository.FailMsgRepository;
import com.sl.mq.service.MQService;
import com.xxl.job.core.handler.annotation.XxlJob;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * 失败消息的处理任务
 *
 * @author wjlong1128
 * @since 1.0
 */
@Slf4j
@Component
@ConditionalOnBean({MQService.class, FailMsgRepository.class})
public class FailMsgJob {

    @Resource
    private MQService mqService;

    @Resource
    private FailMsgRepository failMsgRepository;

    /**
     * 将失败消息表中的消息进行重新发送
     */
    @XxlJob("failMsgJob")
    public void execute() {
        // 查询失败的消息， 每次最多处理100条错误消息
        List<FailMsgEntity> msgs = this.failMsgRepository.queryFailMsgList(100);
        if (CollUtil.isEmpty(msgs)) {
            return;
        }

        for (FailMsgEntity msg : msgs) {
            try {
                this.mqService.sendMsg(msg.getExchange(), msg.getRoutingKey(), msg.getMsg());
                // 如果发送成功，就删除该消息
                this.failMsgRepository.removeById(msg.getId());
            } catch (Exception e) {
                log.error("处理错误消息失败, failMsg = {}", msg);
            }
        }
    }

}

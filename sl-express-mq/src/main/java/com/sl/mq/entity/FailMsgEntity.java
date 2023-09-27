package com.sl.mq.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.sl.transport.common.entity.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 错误消息记录实体
 *
 * @author wjlong1128
 * @since 1.0
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("sl_fail_msg")
public class FailMsgEntity extends BaseEntity {

    /**
     * 消息id
     */
    private String msgId;
    /**
     * 交换机
     */
    private String exchange;
    /**
     * 路由键
     */
    private String routingKey;
    /**
     * 消息体
     */
    private String msg;
    /**
     * 失败原因
     */
    private String reason;

}

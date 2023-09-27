package com.sl.mq.service;

/**
 * 封装的消息发送service
 *
 * @author wjlong1128
 * @since 1.0
 */
public interface MQService {

    /**
     * 发送实时消息
     *
     * @param exchange   交换机
     * @param routingKey 路由键
     * @param msg        消息
     * @return 是否发送成功
     */
    Boolean sendMsg(String exchange, String routingKey, Object msg);

    /**
     *
     * @param exchange 交换机
     * @param routingKey 路由键
     * @param msg 消息
     * @param delay 延迟时间，单位毫秒
     * @return 是否成功
     */
    Boolean sendMsg(String exchange, String routingKey, Object msg, int delay);
}

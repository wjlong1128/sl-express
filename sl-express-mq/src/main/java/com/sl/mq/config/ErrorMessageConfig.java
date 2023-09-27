package com.sl.mq.config;

import com.sl.transport.common.constant.MQ;
import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.core.TopicExchange;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 异常消息处理配置
 *
 * @author wjlong1128
 * @since 1.0
 */

@Configuration
public class ErrorMessageConfig {

    /**
     * 获取当前微服务名称
     */
    @Value("${spring.application.name}")
    private String appName;

    /**
     * 错误消息交换机
     *
     * @return topic
     */
    @Bean
    public TopicExchange errorMessageExchange() {
        return new TopicExchange(MQ.Exchanges.ERROR, true, false);
    }

    /**
     * 错误消息队列
     *
     * @return queue
     */
    @Bean
    public Queue errorQueue() {
        return new Queue(MQ.Queues.ERROR_PREFIX + this.appName, true);
    }

    /**
     * 建立绑定关系
     */
    @Bean
    public Binding errorBinding(TopicExchange errorMessageExchange, Queue errorQueue) {
        return BindingBuilder.bind(errorQueue).to(errorMessageExchange).with(this.appName);
    }


}

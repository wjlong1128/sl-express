package com.sl.transport.common.config.feign;

import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author wjlong1128
 * @since 1.0
 */
@Configuration
public class FeignErrorDecoderConfig {

    /**
     * 如果工程中没有自己的feignErrorDecoder，那么就使用默认的通用解码器，
     * 否则自己实现注入此抽象类
     *
     * @return 通用异常解码器
     */
    @ConditionalOnMissingBean
    @Bean
    public FeignErrorDecoder feignErrorDecoder() {
        return new CommonFeignErrorDecoder();
    }

}

package com.sl.transport.common.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author wjlong1128
 * @since 1.0
 */
@Component
@ConfigurationProperties(prefix = "spring.alioss")
@Data
public class AliOSSProperties {
    private String endpoint;
    private String accessKeyId;
    private String accessKeySecret;
    private String bucketName;
}

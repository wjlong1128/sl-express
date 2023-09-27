package com.sl.transport.common.config.feign;

import cn.hutool.core.io.IoUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import feign.Response;
import feign.codec.ErrorDecoder;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

/**
 * feign解码器 远程调用失败，对异常进行解析与再次封装
 * 该项目架构中，对于远程调用，返回的异常实体是 {@link com.sl.transport.common.exception.SLException}
 *
 * @author wjlong1128
 * @since 1.0
 */
@Slf4j
public abstract class FeignErrorDecoder implements ErrorDecoder {

    /**
     * @param status http响应状态码
     * @param code   业务状态码
     * @param msg    响应的消息
     * @return Exception 留给子类扩展
     */
    public abstract Exception call(int status, int code, String msg);

    @Override
    public Exception decode(String methodKey, Response response) {
        String message = null;
        try {
            message = IoUtil.read(response.body().asReader(StandardCharsets.UTF_8));
            log.info("method-key:{}, response:{}", methodKey, message);
            JSONObject json = JSONUtil.parseObj(message);
            return this.call(response.status(), json.getInt("code"), json.getStr("msg"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}

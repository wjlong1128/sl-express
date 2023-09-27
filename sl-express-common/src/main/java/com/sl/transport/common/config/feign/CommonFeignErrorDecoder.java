package com.sl.transport.common.config.feign;

import com.sl.transport.common.exception.SLException;

/**
 * 通用远程调用异常解码器实现
 *
 * @author wjlong1128
 * @since 1.0
 */
public class CommonFeignErrorDecoder extends FeignErrorDecoder {
    @Override
    public Exception call(int status, int code, String msg) {
        return new SLException(msg, status, code);
    }
}

package com.sl.transport.common.exception;

import com.sl.transport.common.enums.BaseEnum;
import com.sl.transport.common.enums.BaseExceptionEnum;
import lombok.Getter;

/**
 * 自定义异常，该异常应用于与前端对接
 *
 * @author wjlong1128
 * @since 1.0
 */
@Getter
public class SLWebException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    /**
     * http响应状态码
     */
    private int status = 200;

    /**
     * 业务状态码
     */
    private int code = 1;

    /**
     * 异常信息
     */
    private String msg;

    public SLWebException(BaseEnum baseEnum) {
        super(baseEnum.getValue());
        this.msg = baseEnum.getValue();
        this.code = baseEnum.getCode();
    }

    public SLWebException(BaseEnum baseEnum, Throwable e) {
        super(baseEnum.getValue(), e);
        this.msg = baseEnum.getValue();
        this.code = baseEnum.getCode();
    }

    public SLWebException(BaseExceptionEnum errorEnum) {
        super(errorEnum.getValue());
        this.status = errorEnum.getStatus();
        this.msg = errorEnum.getValue();
        this.code = errorEnum.getCode();
    }

    public SLWebException(BaseExceptionEnum errorEnum, Throwable e) {
        super(errorEnum.getValue(), e);
        this.status = errorEnum.getStatus();
        this.msg = errorEnum.getValue();
        this.code = errorEnum.getCode();
    }

    public SLWebException(String msg) {
        super(msg);
        this.msg = msg;
    }

    public SLWebException(String msg, Throwable e) {
        super(msg, e);
        this.msg = msg;
    }

    public SLWebException(String msg, int code) {
        super(msg);
        this.msg = msg;
        this.code = code;
    }

    public SLWebException(String msg, int code, int status) {
        super(msg);
        this.msg = msg;
        this.code = code;
        this.status = status;
    }

    public SLWebException(String msg, int code, Throwable e) {
        super(msg, e);
        this.msg = msg;
        this.code = code;
    }

    public SLWebException(String msg, int code, int status, Throwable e) {
        super(msg, e);
        this.msg = msg;
        this.code = code;
        this.status = status;
    }
}

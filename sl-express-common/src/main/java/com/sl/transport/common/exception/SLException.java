package com.sl.transport.common.exception;

import com.sl.transport.common.enums.BaseEnum;
import com.sl.transport.common.enums.BaseExceptionEnum;
import lombok.Getter;

/**
 * 自定义异常，针对于一般业务出现的异常，无需对前端始终保持200状态码
 *
 * @author wjlong1128
 * @since 1.0
 */
@Getter
public class SLException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    /**
     * http状态码
     */
    private int status = 500;

    /**
     * 业务状态码，规则：4位数，1001开始递增
     */
    private int code = 1001;

    /**
     * 异常中的消息
     */
    private String msg;

    public SLException(BaseEnum baseEnum) {
        super(baseEnum.getValue());
        this.code = code;
        this.msg = baseEnum.getValue();
    }

    public SLException(BaseEnum baseEnum, Throwable e) {
        super(baseEnum.getValue(), e);
        this.msg = baseEnum.getValue();
        this.code = baseEnum.getCode();
    }

    public SLException(BaseExceptionEnum errorEnum) {
        super(errorEnum.getValue());
        this.status = errorEnum.getStatus();
        this.msg = errorEnum.getValue();
        this.code = errorEnum.getCode();
    }

    public SLException(BaseExceptionEnum errorEnum, Throwable e) {
        super(errorEnum.getValue(), e);
        this.status = errorEnum.getStatus();
        this.msg = errorEnum.getValue();
        this.code = errorEnum.getCode();
    }

    public SLException(String msg) {
        super(msg);
        this.msg = msg;
    }

    public SLException(String msg, Throwable e) {
        super(msg, e);
        this.msg = msg;
    }

    public SLException(String msg, int code) {
        super(msg);
        this.msg = msg;
        this.code = code;
    }

    public SLException(String msg, int code, int status) {
        super(msg);
        this.msg = msg;
        this.code = code;
        this.status = status;
    }

    public SLException(String msg, int code, Throwable e) {
        super(msg, e);
        this.msg = msg;
        this.code = code;
    }

    public SLException(String msg, int code, int status, Throwable e) {
        super(msg, e);
        this.msg = msg;
        this.code = code;
        this.status = status;
    }

}

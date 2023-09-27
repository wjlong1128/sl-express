package com.sl.transport.common.enums;

/**
 * 所有的表示异常类型枚举都要实现该接口
 *
 * @author wjlong1128
 * @since 1.0
 */
public interface BaseExceptionEnum extends BaseEnum {
    /**
     * http响应状态码
     *
     * @return {@code Integer}
     */
    Integer getStatus();
}

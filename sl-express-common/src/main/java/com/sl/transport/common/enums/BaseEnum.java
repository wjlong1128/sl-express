package com.sl.transport.common.enums;

/**
 * 所有的枚举都必须要实现该接口
 *
 * @author wjlong1128
 * @since 1.0
 */
public interface BaseEnum {

    /**
     * 业务状态码
     */
    Integer getCode();

    /**
     * 业务状态说明
     */
    String getValue();

}

package com.sl.transport.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 用于生成自增长id的枚举
 *
 * @author wjlong1128
 * @since 1.0
 */
@AllArgsConstructor
@Getter
public enum IdEnum implements BaseEnum {

    TRANSPORT_ORDER(1, "运单号", "transport_order", "segment", "SL");

    private Integer code;
    private String value;
    /**
     * 业务名称
     */
    private String business;
    /**
     * 自增长类型
     */
    private String type;
    /**
     * id前缀
     */
    private String prefix;

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("IdEnum{");
        sb.append("code=").append(code);
        sb.append(", value='").append(value).append('\'');
        sb.append(", biz='").append(business).append('\'');
        sb.append(", type='").append(type).append('\'');
        sb.append(", prefix='").append(prefix).append('\'');
        sb.append('}');
        return sb.toString();
    }
}

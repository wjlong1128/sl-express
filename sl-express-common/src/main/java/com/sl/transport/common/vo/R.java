package com.sl.transport.common.vo;

import cn.hutool.core.util.NumberUtil;
import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * 服务端响应实体
 * @author wjlong1128
 * @since 1.0
 */
@Data
public class R<T> implements Serializable {

    private static final long serialVersionUID = -4326147203336606257L;

    @ApiModelProperty(value = "状态编码：200-成功，非200 -> 失败", required = true)
    private Integer code;
    @ApiModelProperty(value = "提示消息", required = true)
    private String msg;
    @ApiModelProperty(value = "响应数据", required = true)
    private T data; // 数据

    public static <T> R<T> success() {
        return success(null);
    }

    public static <T> R<T> success(T object) {
        R<T> r = new R<T>();
        r.data = object;
        r.code = 200;
        r.msg = "ok";
        return r;
    }

    public static <T> R<T> error(String msg) {
        R r = new R();
        r.msg = msg;
        r.code = 1;
        return r;
    }

    public static <T> R<T> error(T object, String msg) {
        R r = new R();
        r.msg = msg;
        r.code = 1;
        r.data = object;
        return r;
    }

    /**
     * 是否成功
     *
     * @return
     */
    @JsonIgnore
    public Boolean isSuccess() {
        return NumberUtil.equals(this.code, 0);
    }

}

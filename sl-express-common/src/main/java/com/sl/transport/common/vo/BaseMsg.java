package com.sl.transport.common.vo;

import cn.hutool.json.JSONUtil;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

/**
 * ”消息类“的共有父类
 *
 * @author wjlong1128
 * @since 1.0
 */
@Data
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
public class BaseMsg {

    /**
     * 扩展信息
     */
    private String info;
    /**
     * 创建时间，毫秒值
     */
    private Long created;

    public String toJson(){
        return JSONUtil.toJsonStr(this);
    }

}

package com.sl.transport.common.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 所有与数据库对应实体的父类
 *
 * @author wjlong1128
 * @since 1.0
 */
@Data
public abstract class BaseEntity {

    /**
     * 主键
     */
    @TableId
    private Long id;
    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime created;
    /**
     * 修改时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updated;

}

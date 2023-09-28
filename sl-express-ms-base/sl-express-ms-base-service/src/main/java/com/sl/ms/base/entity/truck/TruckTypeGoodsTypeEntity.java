package com.sl.ms.base.entity.truck;

import com.baomidou.mybatisplus.annotation.TableName;
import com.sl.transport.common.entity.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 车辆与货物类型关联表
 *
 * @author wjlong1128
 * @since 1.0
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("sl_truck_type_goods_type")
public class TruckTypeGoodsTypeEntity extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 车辆类型id
     */
    private Long truckTypeId;

    /**
     * 货物类型id
     */
    private Long goodsTypeId;

}

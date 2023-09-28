package com.sl.ms.base.repository.truck;

import com.sl.ms.base.entity.truck.TruckTypeGoodsTypeEntity;
import com.sl.transport.common.repository.IRepository;

import java.util.List;
import java.util.Map;

/**
 * @author wjlong1128
 * @since 1.0
 */
public interface TruckTypeGoodsTypeRepository extends IRepository<TruckTypeGoodsTypeEntity> {
    List<Long> findTruckIdsByGoodsTypeId(Long id);

    Map<Long, List<Long>> findTruckIdsByGoodsTypeId(List<Long> ids);

    void removeByGoodsTypeId(Long id);
}

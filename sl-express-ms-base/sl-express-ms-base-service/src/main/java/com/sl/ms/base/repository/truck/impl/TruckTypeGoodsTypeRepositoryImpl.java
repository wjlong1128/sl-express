package com.sl.ms.base.repository.truck.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.sl.ms.base.entity.truck.TruckTypeGoodsTypeEntity;
import com.sl.ms.base.mapper.truck.TruckTypeGoodsTypeMapper;
import com.sl.ms.base.repository.truck.TruckTypeGoodsTypeRepository;
import com.sl.transport.common.repository.impl.RepositoryImpl;
import org.springframework.stereotype.Repository;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author wjlong1128
 * @since 1.0
 */
@Repository
public class TruckTypeGoodsTypeRepositoryImpl extends RepositoryImpl<TruckTypeGoodsTypeMapper, TruckTypeGoodsTypeEntity> implements TruckTypeGoodsTypeRepository {

    @Override
    public List<Long> findTruckIdsByGoodsTypeId(Long id) {
        LambdaQueryWrapper<TruckTypeGoodsTypeEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper
                .select(TruckTypeGoodsTypeEntity::getTruckTypeId)
                .eq(TruckTypeGoodsTypeEntity::getGoodsTypeId, id);
        return this.list(queryWrapper).stream().map(TruckTypeGoodsTypeEntity::getTruckTypeId).collect(Collectors.toList());
    }

    @Override
    public Map<Long, List<Long>> findTruckIdsByGoodsTypeId(List<Long> ids) {
        if (CollUtil.isEmpty(ids)) {
            return Collections.emptyMap();
        }
        LambdaQueryWrapper<TruckTypeGoodsTypeEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.in(TruckTypeGoodsTypeEntity::getGoodsTypeId, ids);
        List<TruckTypeGoodsTypeEntity> list = this.list(queryWrapper);
        if (CollUtil.isEmpty(list)) {
            return ids.stream().collect(Collectors.toMap(k -> k, v -> Collections.emptyList()));
        }
        HashMap<Long, List<Long>> longListHashMap = new HashMap<>();
        list.stream()
                .collect(Collectors.groupingBy(TruckTypeGoodsTypeEntity::getGoodsTypeId))
                .forEach((k, v) -> {
                    List<Long> collect = v.stream().map(TruckTypeGoodsTypeEntity::getTruckTypeId).collect(Collectors.toList());
                    longListHashMap.put(k, collect);
                });
        return longListHashMap;
    }

    @Override
    public void removeByGoodsTypeId(Long id) {
        this.remove(new LambdaQueryWrapper<TruckTypeGoodsTypeEntity>().eq(TruckTypeGoodsTypeEntity::getGoodsTypeId,id));
    }


}

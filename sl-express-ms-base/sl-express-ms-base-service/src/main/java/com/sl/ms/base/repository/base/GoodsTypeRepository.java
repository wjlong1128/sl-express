package com.sl.ms.base.repository.base;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sl.ms.base.entity.base.GoodsTypeEntity;
import com.sl.transport.common.repository.IRepository;

import java.util.List;

/**
 * @author wjlong1128
 * @since 1.0
 */
public interface GoodsTypeRepository extends IRepository<GoodsTypeEntity> {
    List<GoodsTypeEntity> findAll(List<Long> ids);

    IPage<GoodsTypeEntity> findByCondition(Page<GoodsTypeEntity> goodsTypeEntityPage, String name, Long truckTypeId);
}

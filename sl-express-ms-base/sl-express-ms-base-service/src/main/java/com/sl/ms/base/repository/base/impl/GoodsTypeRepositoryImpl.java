package com.sl.ms.base.repository.base.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sl.ms.base.entity.base.GoodsTypeEntity;
import com.sl.ms.base.mapper.base.GoodsTypeMapper;
import com.sl.ms.base.repository.base.GoodsTypeRepository;
import com.sl.transport.common.repository.impl.RepositoryImpl;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author wjlong1128
 * @since 1.0
 */
@Repository
public class GoodsTypeRepositoryImpl extends RepositoryImpl<GoodsTypeMapper, GoodsTypeEntity> implements GoodsTypeRepository {
    @Override
    public List<GoodsTypeEntity> findAll(List<Long> ids) {
        LambdaQueryWrapper<GoodsTypeEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper
                .in(CollUtil.isNotEmpty(ids), GoodsTypeEntity::getId, ids)
                .eq(GoodsTypeEntity::getStatus, 1);
        return this.list(queryWrapper);
    }

    @Override
    public IPage<GoodsTypeEntity> findByCondition(Page<GoodsTypeEntity> goodsTypeEntityPage, String name, Long truckTypeId) {
        List<GoodsTypeEntity> list = this.baseMapper.findByPage(goodsTypeEntityPage, name, truckTypeId);
        goodsTypeEntityPage.setRecords(list);
        return goodsTypeEntityPage;
    }
}

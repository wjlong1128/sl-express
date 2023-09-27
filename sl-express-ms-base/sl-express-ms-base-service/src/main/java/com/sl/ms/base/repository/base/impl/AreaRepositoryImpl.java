package com.sl.ms.base.repository.base.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.sl.ms.base.entity.base.AreaEntity;
import com.sl.ms.base.mapper.base.AreaMapper;
import com.sl.ms.base.repository.base.AreaRepository;
import com.sl.transport.common.repository.impl.RepositoryImpl;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author wjlong1128
 * @since 1.0
 */
@Repository
public class AreaRepositoryImpl extends RepositoryImpl<AreaMapper, AreaEntity> implements AreaRepository {
    @Override
    public AreaEntity getByCode(String code) {
        LambdaQueryWrapper<AreaEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(AreaEntity::getAreaCode, code);
        return this.getOne(queryWrapper);
    }

    @Override
    public List<AreaEntity> findChildren(Long parentId) {
        LambdaQueryWrapper<AreaEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(AreaEntity::getParentId,parentId);
        return this.list(queryWrapper);
    }
}

package com.sl.ms.base.repository.base;

import com.sl.ms.base.entity.base.AreaEntity;
import com.sl.transport.common.repository.IRepository;

import java.util.List;

/**
 * @author wjlong1128
 * @since 1.0
 */
public interface AreaRepository extends IRepository<AreaEntity> {
    AreaEntity getByCode(String code);

    List<AreaEntity> findChildren(Long parentId);
}

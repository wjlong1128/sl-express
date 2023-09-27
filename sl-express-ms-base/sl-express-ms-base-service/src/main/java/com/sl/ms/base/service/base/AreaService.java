package com.sl.ms.base.service.base;

import com.sl.ms.base.domain.base.AreaDto;

import java.util.List;

/**
 * @author wjlong1128
 * @since 1.0
 */
public interface AreaService {
    AreaDto getById(Long id);

    AreaDto getByCode(String code);

    /**
     * 根据父级id查询子级行政区域
     *
     * @param parentId
     * @return
     */
    List<AreaDto> findChildren(Long parentId);

    List<AreaDto> findBatch(List<Long> ids);
}

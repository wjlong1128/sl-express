package com.sl.ms.base.service.base;

import com.sl.ms.base.domain.base.GoodsTypeDto;
import com.sl.transport.common.vo.PageResponse;

import java.util.List;

/**
 * @author wjlong1128
 * @since 1.0
 */
public interface GoodsTypeService {
    GoodsTypeDto saveGoodsType(GoodsTypeDto dto);

    GoodsTypeDto findById(Long id);

    List<GoodsTypeDto> findAll(List<Long> ids);

    PageResponse<GoodsTypeDto> findByCondition(Integer page, Integer pageSize, String name, Long truckTypeId);

    GoodsTypeDto updateGoodsType(GoodsTypeDto dto);

    List<GoodsTypeDto> findGoodsTypeList();

    void disableGoodsType(Long id);
}

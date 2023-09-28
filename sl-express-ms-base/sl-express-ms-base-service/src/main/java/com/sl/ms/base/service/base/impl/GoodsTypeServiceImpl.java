package com.sl.ms.base.service.base.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sl.ms.base.domain.base.GoodsTypeDto;
import com.sl.ms.base.domain.constants.TruckConstant;
import com.sl.ms.base.entity.base.GoodsTypeEntity;
import com.sl.ms.base.entity.truck.TruckTypeGoodsTypeEntity;
import com.sl.ms.base.repository.base.GoodsTypeRepository;
import com.sl.ms.base.repository.truck.TruckTypeGoodsTypeRepository;
import com.sl.ms.base.service.base.GoodsTypeService;
import com.sl.transport.common.util.BeanUtil;
import com.sl.transport.common.util.ObjectUtil;
import com.sl.transport.common.vo.PageResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author wjlong1128
 * @since 1.0
 */
@Slf4j
@Service
public class GoodsTypeServiceImpl implements GoodsTypeService {

    @Resource
    private GoodsTypeRepository goodsTypeRepository;

    @Resource
    private TruckTypeGoodsTypeRepository truckTypeGoodsTypeRepository;

    @Override
    public GoodsTypeDto saveGoodsType(GoodsTypeDto dto) {
        GoodsTypeEntity goodsTypeEntity = BeanUtil.copyProperties(dto, GoodsTypeEntity.class);
        this.goodsTypeRepository.save(goodsTypeEntity);
        Long id = goodsTypeEntity.getId();
        if (ObjectUtil.isNotEmpty(id)) {
            // 一种商品类型可以关联不同的车辆
            List<TruckTypeGoodsTypeEntity> collect = dto.getTruckTypeIds()
                    .stream()
                    .map(truckTypeId ->
                            TruckTypeGoodsTypeEntity.builder()
                                    .goodsTypeId(id)
                                    .truckTypeId(truckTypeId)
                                    .build()
                    )
                    .collect(Collectors.toList());
            this.truckTypeGoodsTypeRepository.saveBatch(collect);
        }
        BeanUtil.copyProperties(goodsTypeEntity, dto);
        return dto;
    }

    @Override
    public GoodsTypeDto findById(Long id) {
        GoodsTypeEntity entity = this.goodsTypeRepository.getById(id);
        log.info("base ---  goodsTypeService.getById  result:{}", entity);
        if (entity == null) {
            return null;
        }
        GoodsTypeDto dto = BeanUtil.copyProperties(entity, GoodsTypeDto.class);
        List<Long> truckTypeIds = this.truckTypeGoodsTypeRepository.findTruckIdsByGoodsTypeId(entity.getId());
        dto.setTruckTypeIds(truckTypeIds);
        return dto;
    }

    @Override
    public List<GoodsTypeDto> findAll(List<Long> ids) {
        List<GoodsTypeEntity> entities = this.goodsTypeRepository.findAll(ids);
        if (CollUtil.isEmpty(entities)) {
            return Collections.emptyList();
        }
        Map<Long, List<Long>> truckTypeIdMap = this.truckTypeGoodsTypeRepository.findTruckIdsByGoodsTypeId(ids);
        return entities.stream()
                .map(goodsTypeEntity -> {
                    GoodsTypeDto dto = BeanUtil.copyProperties(goodsTypeEntity, GoodsTypeDto.class);
                    dto.setTruckTypeIds(truckTypeIdMap.get(dto.getId()));
                    return dto;
                }).collect(Collectors.toList());
    }

    @Override
    public PageResponse<GoodsTypeDto> findByCondition(Integer page, Integer pageSize, String name, Long truckTypeId) {
        IPage<GoodsTypeEntity> iPage = this.goodsTypeRepository.findByCondition(new Page<GoodsTypeEntity>(page, pageSize), name, truckTypeId);
        List<Long> goodsTypeIds = iPage.getRecords().stream().map(GoodsTypeEntity::getId).collect(Collectors.toList());
        Map<Long, List<Long>> map = this.truckTypeGoodsTypeRepository.findTruckIdsByGoodsTypeId(goodsTypeIds);
        List<GoodsTypeDto> item = iPage.getRecords().stream()
                .map(
                        goodsType -> {
                            GoodsTypeDto dto = BeanUtil.copyProperties(goodsType, GoodsTypeDto.class);
                            dto.setTruckTypeIds(map.get(goodsType.getId()));
                            return dto;
                        }
                ).collect(Collectors.toList());
        return PageResponse.<GoodsTypeDto>builder()
                .page(page)
                .pageSize(pageSize)
                .pages(iPage.getPages())
                .counts(iPage.getTotal())
                .items(item)
                .build();
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public GoodsTypeDto updateGoodsType(GoodsTypeDto dto) {
        GoodsTypeEntity goodsTypeEntity = BeanUtil.copyProperties(dto, GoodsTypeEntity.class);
        this.goodsTypeRepository.updateById(goodsTypeEntity);
        this.truckTypeGoodsTypeRepository.removeByGoodsTypeId(dto.getId());
        this.truckTypeGoodsTypeRepository.saveBatch(
                dto.getTruckTypeIds().stream()
                        .map(item -> TruckTypeGoodsTypeEntity.builder().truckTypeId(item).goodsTypeId(dto.getId()).build())
                        .collect(Collectors.toList())
        );
        return BeanUtil.copyProperties(this.goodsTypeRepository.getById(dto.getId()), GoodsTypeDto.class);
    }

    @Override
    public List<GoodsTypeDto> findGoodsTypeList() {
        List<GoodsTypeEntity> list = this.goodsTypeRepository.list(new LambdaQueryWrapper<GoodsTypeEntity>().eq(GoodsTypeEntity::getStatus, 1));
        return list.stream().map(item -> BeanUtil.toBean(item, GoodsTypeDto.class)).collect(Collectors.toList());
    }

    @Override
    public void disableGoodsType(Long id) {
        GoodsTypeEntity pdGoodsType = new GoodsTypeEntity();
        pdGoodsType.setId(id);
        pdGoodsType.setStatus(TruckConstant.DATA_DISABLE_STATUS);
        this.goodsTypeRepository.updateById(pdGoodsType);
    }

}

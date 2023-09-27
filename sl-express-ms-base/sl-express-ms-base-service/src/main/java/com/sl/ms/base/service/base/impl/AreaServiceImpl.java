package com.sl.ms.base.service.base.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.sl.ms.base.domain.base.AreaDto;
import com.sl.ms.base.entity.base.AreaEntity;
import com.sl.ms.base.repository.base.AreaRepository;
import com.sl.ms.base.service.base.AreaService;
import com.sl.transport.common.util.BeanUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author wjlong1128
 * @since 1.0
 */
@Service
public class AreaServiceImpl implements AreaService {

    @Resource
    private AreaRepository areaRepository;

    @Override
    public AreaDto getById(Long id) {
        AreaDto dto = BeanUtil.toBean(this.areaRepository.getById(id), AreaDto.class);
        dto.setName(dto.getShortName());
        return dto;
    }

    @Override
    public AreaDto getByCode(String code) {
        AreaDto dto = BeanUtil.toBean(this.areaRepository.getByCode(code), AreaDto.class);
        dto.setName(dto.getShortName());
        return dto;
    }

    /**
     * 业务中不需要“市辖区 || level = 2”
     *
     * @param parentId
     * @return
     */
    @Override
    public List<AreaDto> findChildren(Long parentId) {
        List<AreaEntity> areaEntityList = this.areaRepository.findChildren(parentId);
        return areaEntityList.stream()
                .filter(item -> !(item.getLevel().equals(2) && StrUtil.equals("市辖区", item.getName())))
                .map(item -> {
                    AreaDto dto = BeanUtil.toBean(item, AreaDto.class);
                    dto.setName(dto.getShortName());
                    return dto;
                }).collect(Collectors.toList());
    }

    @Override
    public List<AreaDto> findBatch(List<Long> ids) {
        LambdaQueryWrapper<AreaEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.in(AreaEntity::getId, ids);
        List<AreaEntity> list = this.areaRepository.list(queryWrapper);
        return list.stream().map(item -> {
            AreaDto dto = BeanUtil.toBean(item, AreaDto.class);
            dto.setName(dto.getShortName());
            return dto;
        }).collect(Collectors.toList());
    }


}

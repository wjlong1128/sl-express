package com.sl.ms.base.controller.base;

import com.sl.ms.base.domain.base.AreaDto;
import com.sl.ms.base.service.base.AreaService;
import com.sl.transport.common.util.BeanUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * 行政区域详细地址控制器 a
 * @author wjlong1128
 * @since 1.0
 */
@Slf4j
@Validated
@RequestMapping("area")
@RestController
@Api(value = "Area", tags = "行政区域")
public class AreaController {

    @Resource
    private AreaService areaService;

    /**
     * 根据id获取行政区域详情
     *
     * @param id 行政区域id
     * @return 行政区域id
     */
    @GetMapping("{id}")
    public AreaDto get(@PathVariable Long id) {
        AreaDto dto = BeanUtil.toBean(this.areaService.getById(id), AreaDto.class);
        dto.setName(dto.getShortName());
        return dto;
    }

    /**
     * 根据code获取行政区域详情
     *
     * @param code
     * @return
     */
    @GetMapping("code/{code}")
    public AreaDto getByCode(@PathVariable String code) {
        AreaDto dto = BeanUtil.toBean(this.areaService.getByCode(code), AreaDto.class);
        dto.setName(dto.getShortName());
        return dto;
    }

    /**
     * 根据父级id查询子级行政区域
     *
     * @param parentId
     * @return
     */
    @GetMapping("/children")
    @ApiOperation(value = "根据父级id查询子级行政区域")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "parentId", value = "父级id", required = true, dataTypeClass = Long.class)})
    public List<AreaDto> findChildren(@NotNull(message = "父id不能为空!") @RequestParam("parentId") Long parentId) {
        return areaService.findChildren(parentId);
    }

    /**
     * 批量通过id获取
     *
     * @param ids
     * @return
     */
    @GetMapping("/batch")
    @ApiOperation(value = "根据id批量查询")
    @ApiImplicitParams({@ApiImplicitParam(name = "ids", value = "id列表", required = true, dataTypeClass = Long.class)})
    public List<AreaDto> findBatch(@NotNull(message = "列表不能为空!") @RequestParam("ids") List<Long> ids) {
        return areaService.findBatch(ids);
    }
}

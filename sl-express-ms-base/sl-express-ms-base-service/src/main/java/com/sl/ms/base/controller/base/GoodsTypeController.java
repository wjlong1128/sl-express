package com.sl.ms.base.controller.base;

import com.sl.ms.base.domain.base.GoodsTypeDto;
import com.sl.ms.base.service.base.GoodsTypeService;
import com.sl.transport.common.vo.PageResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 货物类型业务
 *
 * @author wjlong1128
 * @since 1.0
 */
@RestController
@RequestMapping("base/goodsType")
@Slf4j
public class GoodsTypeController {

    @Resource
    private GoodsTypeService goodsTypeService;

    /**
     * 添加货物类型
     *
     * @param dto 货物类型信息
     * @return 货物类型信息
     */
    @PostMapping
    public GoodsTypeDto saveGoodsType(@RequestBody GoodsTypeDto dto) {
        return this.goodsTypeService.saveGoodsType(dto);
    }

    /**
     * 根据id获取货物类型详情
     *
     * @param id 货物类型id
     * @return 货物类型信息
     */
    @GetMapping("/{id}")
    public GoodsTypeDto fineById(@PathVariable(name = "id") Long id) {
        return this.goodsTypeService.findById(id);
    }

    /**
     * 获取货物类型列表
     *
     * @return 货物类型列表
     */
    @GetMapping
    public List<GoodsTypeDto> findAll(@RequestParam(name = "ids", required = false) List<Long> ids) {
        return this.goodsTypeService.findAll(ids);
    }

    /**
     * 获取分页货物类型数据
     *
     * @param page        页码
     * @param pageSize    页尺寸
     * @param name        货物类型名称
     * @param truckTypeId 车辆类型Id
     * @return 分页结果
     */
    @GetMapping("/page")
    public PageResponse<GoodsTypeDto> findByPage(
            @RequestParam(name = "page") Integer page,
            @RequestParam(name = "pageSize") Integer pageSize,
            @RequestParam(name = "name", required = false) String name,
            @RequestParam(name = "truckTypeId", required = false) Long truckTypeId) {
        return this.goodsTypeService.findByCondition(page, pageSize, name, truckTypeId);
    }


    /**
     * 更新货物类型信息
     *
     * @param id  货物类型id
     * @param dto 货物类型信息
     * @return 货物类型信息
     */
    @PutMapping("/{id}")
    public GoodsTypeDto update(@PathVariable(name = "id") Long id, @RequestBody GoodsTypeDto dto) {
        dto.setId(id);
        return this.goodsTypeService.updateGoodsType(dto);
    }


    @GetMapping("/all")
    public List<GoodsTypeDto> findAll() {
        return this.goodsTypeService.findGoodsTypeList();
    }


    /**
     * 删除货物类型
     *
     * @param id 货物类型id
     * @return 返回信息
     */
    @PutMapping("/{id}/disable")
    public void disable(@PathVariable(name = "id") Long id) {
        this.goodsTypeService.disableGoodsType(id);
    }
}
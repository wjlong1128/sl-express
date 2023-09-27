package com.sl.transport.common.repository;

import com.baomidou.mybatisplus.extension.service.IService;

/**
 * repository顶级接口，独立建立一个 包，用来实现mybatis-plus的条件查询
 *
 * @author wjlong1128
 * @since 1.0
 */
public interface IRepository<T> extends IService<T> {


}

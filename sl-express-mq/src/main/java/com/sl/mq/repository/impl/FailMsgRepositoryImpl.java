package com.sl.mq.repository.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.sl.mq.entity.FailMsgEntity;
import com.sl.mq.mapper.FailMsgMapper;
import com.sl.mq.repository.FailMsgRepository;
import com.sl.transport.common.repository.impl.RepositoryImpl;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author wjlong1128
 * @since 1.0
 */

@Repository
public class FailMsgRepositoryImpl extends RepositoryImpl<FailMsgMapper, FailMsgEntity> implements FailMsgRepository {
    @Override
    public List<FailMsgEntity> queryFailMsgList(int count) {
        return this.list(Wrappers.<FailMsgEntity>lambdaQuery()
                .orderByAsc(FailMsgEntity::getCreated)
                .last(StrUtil.format("limit {}", count)));
    }
}

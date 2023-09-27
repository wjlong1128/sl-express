package com.sl.mq.repository;

import com.sl.mq.entity.FailMsgEntity;
import com.sl.transport.common.repository.IRepository;

import java.util.List;

/**
 * @author wjlong1128
 * @since 1.0
 */
public interface FailMsgRepository extends IRepository<FailMsgEntity> {
    /**
     * 查询count条错误消息，按照创建时间升序排序
     *
     * @param count 数量
     * @return List
     */
    List<FailMsgEntity> queryFailMsgList(int count);
}

package com.sl.transport.common.constant;

/**
 * @author wjlong1128
 * @since 1.0
 */
public interface Locks {
    /**
     * 任务调度锁的前缀
     */
    String DISPATCH_LOCK_PREFIX = "DISPATCH_LOCK_";

    /**
     * 司机作业单锁前缀
     */
    String DRIVER_JOB_LOCK_PREFIX = "DRIVER_JOB_LOCK_";
}

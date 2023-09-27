package com.sl.mq.exception;

import com.sl.mq.entity.FailMsgEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 消息异常
 * @author wjlong1128
 * @since 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MsgException extends RuntimeException {

    private FailMsgEntity failMsgEntity;

}

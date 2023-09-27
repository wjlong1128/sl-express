package com.sl.transport.common.handler;

import cn.hutool.core.exceptions.ExceptionUtil;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.ObjectUtil;
import com.sl.transport.common.exception.SLException;
import com.sl.transport.common.exception.SLWebException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.multipart.MaxUploadSizeExceededException;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.ValidationException;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 全局异常统一拦截器
 *
 * @author wjlong1128
 * @since 1.0
 */
@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {

    /**
     * 参数校验异常
     *
     * @param exception 校验失败异常
     * @return 响应数据
     */
    @ExceptionHandler(ValidationException.class)
    public ResponseEntity<Object> handle(ValidationException exception) {
        List<String> errors = null;
        if (exception instanceof ConstraintViolationException) {
            // 获取异常消息
            errors = ((ConstraintViolationException) exception).getConstraintViolations()
                    .stream().map(ConstraintViolation::getMessage).collect(Collectors.toList());
        }
        if (exception.getCause() != null) {
            log.error("参数校验失败异常 -> ", exception);
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(MapUtil.builder()
                        .put("code", HttpStatus.BAD_REQUEST.value())
                        .put("msg", errors)
                        .build());
    }

    /**
     * 文件上传超过最大限制异常
     *
     * @param exception 未知异常
     * @return 响应数据
     */
    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public ResponseEntity<Object> handle(MaxUploadSizeExceededException exception) {
        if (ObjectUtil.isNotEmpty(exception.getCause())) {
            log.error("文件上传超过最大限制异常 -> ", exception);
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(MapUtil.<String, Object>builder()
                        .put("code", HttpStatus.INTERNAL_SERVER_ERROR.value())
                        .put("msg", "上传图片大小不能超过5M，格式需为jpg、png、gif")
                        .build());
    }

    /**
     * 其他未知异常
     *
     * @param exception 未知异常
     * @return 响应数据
     */
    @ExceptionHandler(Exception.class)
    public ResponseEntity<Object> handle(Exception exception) {
        if (ObjectUtil.isNotEmpty(exception.getCause())) {
            log.error("其他未知异常 -> ", exception);
        }

        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(MapUtil.<String, Object>builder()
                        .put("code", HttpStatus.INTERNAL_SERVER_ERROR.value())
                        .put("msg", ExceptionUtil.stacktraceToString(exception))
                        .build());
    }

    /**
     * 自定义异常处理
     *
     * @param exception 自定义异常
     * @return 响应数据
     */
    @ExceptionHandler(SLException.class)
    public ResponseEntity<Object> handle(SLException exception) {
        if (ObjectUtil.isNotEmpty(exception.getCause())) {
            log.error("自定义异常处理 -> ", exception);
        }
        return ResponseEntity.status(exception.getStatus())
                .body(MapUtil.<String, Object>builder()
                        .put("code", exception.getCode())
                        .put("msg", exception.getMsg())
                        .build());
    }

    /**
     * web自定义异常处理
     *
     * @param exception web自定义异常
     * @return 响应数据
     */
    @ExceptionHandler(SLWebException.class)
    public ResponseEntity<Object> handle(SLWebException exception) {
        if (ObjectUtil.isNotEmpty(exception.getCause())) {
            log.error("自定义异常处理 -> ", exception);
        }
        return ResponseEntity.ok(MapUtil.<String, Object>builder()
                .put("code", exception.getCode())
                .put("msg", exception.getMsg())
                .build());
    }

}

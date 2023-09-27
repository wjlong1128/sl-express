package com.sl.transport.common.aspect;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.json.JSONUtil;
import com.sl.transport.common.exception.SLException;
import com.sl.transport.common.util.AspectUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.validation.ConstraintViolation;
import javax.validation.Validator;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * 请求参数拦截切面，统一对Controller中标注{@link org.springframework.web.bind.annotation.RequestBody}映射的对象进行校验，
 * 在Controller方法中中无需单独标注{@link org.springframework.validation.annotation.Validated}注解
 *
 * @author wjlong1128
 * @since 1.0
 */
@Aspect
@Slf4j
@Component
@EnableAspectJAutoProxy
public class ValidatedAspect {

    @Resource
    private Validator validator;

    @Around("execution(* com.sl..controller.*Controller.*(..))")
    public Object around(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        Object body = AspectUtil.getBody(proceedingJoinPoint);
        if (ObjectUtil.isNotEmpty(body)) {
            Set<ConstraintViolation<Object>> validateResult = this.validator.validate(body);
            if (CollUtil.isNotEmpty(validateResult)) {
                // 说明校验不通过
                List<String> msg = validateResult.stream().map(ConstraintViolation::getMessage).collect(Collectors.toList());
                throw new SLException(JSONUtil.toJsonStr(msg), HttpStatus.BAD_REQUEST.value());
            }
        }
        // 没有被注解修饰 正常执行
        return proceedingJoinPoint.proceed(proceedingJoinPoint.getArgs());
    }

}

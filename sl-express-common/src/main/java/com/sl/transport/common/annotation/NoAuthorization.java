package com.sl.transport.common.annotation;

import java.lang.annotation.*;

/**
 * 被该注解标注的控制器方法不需要校验登录状态
 *
 * @author wjlong1128
 * @since 1.0
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface NoAuthorization {

}

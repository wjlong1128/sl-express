package com.sl.transport.common.interceptor;

import cn.hutool.core.text.CharSequenceUtil;
import com.itheima.auth.factory.AuthTemplateFactory;
import com.itheima.auth.sdk.AuthTemplate;
import com.sl.transport.common.annotation.NoAuthorization;
import com.sl.transport.common.util.AuthTemplateThreadLocal;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * token拦截器，获取请求头中的token信息并加以操作
 * 在用户信息拦截器之后
 *
 * @author wjlong1128
 * @since 1.0
 */
@Slf4j
@Component
public class TokenInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (!(handler instanceof HandlerMethod)) {
            return true;
        }

        HandlerMethod handlerMethod = (HandlerMethod) handler;
        if (handlerMethod.hasMethodAnnotation(NoAuthorization.class)) {
            // 无需校验
            return true;
        }

        String token = request.getHeader("token");
        if (CharSequenceUtil.hasEmpty(token)) {
            response.setStatus(403);
            return false;
        }

        AuthTemplate authTemplate = AuthTemplateFactory.get(token);
        AuthTemplateThreadLocal.set(authTemplate);
        log.info("{}拦截到请求:{}", this.getClass().getSimpleName(), request.getRequestURI());
        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        AuthTemplateThreadLocal.remove();
        log.info("请求结束：{}", request.getRequestURI());
    }
}

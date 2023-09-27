package com.sl.transport.common.util;

import cn.hutool.core.util.ObjectUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.LocalVariableTableParameterNameDiscoverer;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestBody;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 对Aspect提供一些工具方法
 *
 * @author wjlong1128
 * @since 1.0
 */
@Slf4j
public class AspectUtil {

    /**
     * 获取请求体
     *
     * @param proceedingJoinPoint {@link ProceedingJoinPoint}
     * @return {@code Object}
     */
    public static Object getBody(ProceedingJoinPoint proceedingJoinPoint) {
        // 获取实参数
        Object[] args = proceedingJoinPoint.getArgs();
        Method method = getMethod(proceedingJoinPoint);
        if (ObjectUtil.isNotEmpty(args)) {
            // 获取方法参数上所有的注解
            Annotation[][] parameterAnnotations = method.getParameterAnnotations();
            for (int count = 0; count < parameterAnnotations.length; count++) {
                for (Annotation annotation : parameterAnnotations[count]) {
                    // 如果该参数被该注解修饰，那么返回该形参的实参对象
                    if (annotation instanceof RequestBody) {
                        return args[count];
                    }
                }
            }

        }
        return null;
    }

    /**
     * 解析SPEL表达式
     *
     * @param key    key
     * @param method {@link   Method}
     * @param args   {@code Object[]}
     * @return key
     */
    public static String parse(String key, Method method, Object[] args) {
        if (StringUtils.isNotBlank(key) && key.indexOf("#") > -1) {
            Pattern pattern = Pattern.compile("(\\#\\{([^\\}]*)\\})");
            Matcher matcher = pattern.matcher(key);
            List<String> keys = new ArrayList<>();
            while (matcher.find()) {
                keys.add(matcher.group());
            }
            if (!CollectionUtils.isEmpty(keys)) {
                LocalVariableTableParameterNameDiscoverer u = new LocalVariableTableParameterNameDiscoverer();
                String[] paraNameArr = u.getParameterNames(method);
                ExpressionParser parser = new SpelExpressionParser();
                StandardEvaluationContext context = new StandardEvaluationContext();
                for (int i = 0; i < paraNameArr.length; i++) {
                    context.setVariable(paraNameArr[i], args[i]);
                }
                for (String tmp : keys) {
                    key = key.replace(tmp, parser.parseExpression("#" + tmp.substring(2, tmp.length() - 1)).getValue(context, String.class));
                }
                return key;
            }
        }
        return key;
    }

    /**
     * 获取被拦截的方法的方法实例对象
     *
     * @param proceedingJoinPoint {@link ProceedingJoinPoint}
     * @return {@link Method}
     */
    private static Method getMethod(ProceedingJoinPoint proceedingJoinPoint) {
        Signature signature = proceedingJoinPoint.getSignature();
        if (signature instanceof MethodSignature) {
            MethodSignature methodSignature = (MethodSignature) signature;
            return methodSignature.getMethod();
        }
        throw new IllegalArgumentException("It's not method");
    }
}

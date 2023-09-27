package com.sl.transport.common.config.mybatisplus;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.BlockAttackInnerInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * mybatis-plus的配置
 *
 * @author wjlong1128
 * @since 1.0
 */
@Configuration
@ConditionalOnProperty(prefix = "spring.datasource", value = "url")
public class MybatisPlusConfig {
    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor() {

        MybatisPlusInterceptor mybatisPlusInterceptor = new MybatisPlusInterceptor();
        // 设置分页插件
        mybatisPlusInterceptor.addInnerInterceptor(new PaginationInnerInterceptor());

        // 防全表更新与删除插件
        mybatisPlusInterceptor.addInnerInterceptor(new BlockAttackInnerInterceptor());
        return mybatisPlusInterceptor;
    }

    @Component
    public static class MyMetaObjectHandler implements MetaObjectHandler {

        @Override
        public void insertFill(MetaObject metaObject) {
            Object created = getFieldValByName("created", metaObject);
            if (null == created) {
                // 字段为空，可以进行填充
                setFieldValByName("created", LocalDateTime.now(), metaObject);
            }

            Object updated = getFieldValByName("updated", metaObject);
            if (null == updated) {
                // 字段为空，可以进行填充
                setFieldValByName("updated", LocalDateTime.now(), metaObject);
            }
        }

        @Override
        public void updateFill(MetaObject metaObject) {
            // 更新数据时，直接更新字段
            setFieldValByName("updated", LocalDateTime.now(), metaObject);
        }
    }
}

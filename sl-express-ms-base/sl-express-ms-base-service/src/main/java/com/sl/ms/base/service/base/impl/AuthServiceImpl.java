package com.sl.ms.base.service.base.impl;

import cn.hutool.core.text.CharSequenceUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONUtil;
import com.itheima.auth.factory.AuthTemplateFactory;
import com.itheima.auth.sdk.AuthTemplate;
import com.itheima.auth.sdk.common.Result;
import com.itheima.auth.sdk.dto.LoginDTO;
import com.itheima.auth.sdk.dto.UserDTO;
import com.sl.ms.base.service.base.AuthService;
import com.sl.transport.common.exception.SLException;
import com.sl.transport.common.util.ObjectUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.concurrent.TimeUnit;

/**
 * @author wjlong1128
 * @since 1.0
 */
@Slf4j
@Service
public class AuthServiceImpl implements AuthService {

    @Value("${sl.auth.account}")
    private String account;

    @Value("${sl.auth.password}")
    private String password;

    @Resource
    private AuthTemplate authTemplate;

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    @Override
    public UserDTO getByUserId(Long id) {
        String redisKey = "AUTHORIZATION";
        String token = stringRedisTemplate.opsForValue().get(redisKey);
        if (StrUtil.isEmpty(token)) {
            // 重新登录: 这里的重新登录是指当前系统管理员自动登录在权限管家上
            Result<LoginDTO> result = authTemplate.opsForLogin().token(account, password);
            if (ObjectUtil.notEqual(result.getCode(), 0)) {
                String errorMsg = CharSequenceUtil.format("对接权限系统登录失败，账号：{}，密码：{}", account, password);
                throw new SLException(errorMsg);
            }
            // 将token存放在redis
            token = result.getData().getToken().getToken();
            stringRedisTemplate.opsForValue().set(redisKey, token, 1, TimeUnit.HOURS);
            log.info("对接权限系统登录结果：{}", JSONUtil.toJsonStr(result));
        }
        authTemplate = AuthTemplateFactory.get(token);
        Result<UserDTO> result = authTemplate.opsForUser().getUserById(id);
        return result.getData();
    }
}

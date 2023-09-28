package com.sl.ms.base.service.base;

import com.itheima.auth.sdk.dto.UserDTO;

/**
 * @author wjlong1128
 * @since 1.0
 */
public interface AuthService {
    UserDTO getByUserId(Long id);
}

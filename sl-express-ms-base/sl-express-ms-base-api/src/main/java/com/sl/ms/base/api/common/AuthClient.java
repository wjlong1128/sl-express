package com.sl.ms.base.api.common;

import com.itheima.auth.sdk.dto.UserDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import springfox.documentation.annotations.ApiIgnore;

/**
 * 系统用户api
 *
 * @author wjlong1128
 * @since 1.0
 */
@FeignClient(name = "sl-express-ms-base", contextId = "Auth", path = "/auth")
@ApiIgnore
public interface AuthClient {

    /**
     * 根据用户id获得详细信息
     *
     * @param id 用户id
     * @return 用户信息
     */
    @GetMapping("/{id}")
    UserDTO getByUserId(@PathVariable("id") Long id);

}

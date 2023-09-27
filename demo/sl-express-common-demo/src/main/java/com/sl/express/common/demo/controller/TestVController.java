package com.sl.express.common.demo.controller;

import lombok.Data;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.constraints.NotBlank;

/**
 * @author wjlong1128
 * @since 1.0
 */
@RestController
public class TestVController {
    @Data
    public static class User {
        @NotBlank(message = "name不能为空")
        private String name;
    }

    @PostMapping("test")
    public void test(@RequestBody User user) {

    }

}

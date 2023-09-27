package com.sl.express.common.demo.controller;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

import static org.junit.jupiter.api.Assertions.*;

/**
 * @author wjlong1128
 * @since 1.0
 */
@SpringBootTest
class TestVControllerTest {

    @Resource
    private TestVController testVController;

    @Test
    void test() {
       testVController.test(new TestVController.User());
    }
}
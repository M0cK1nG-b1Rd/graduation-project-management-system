package com.gms.gms.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.gms.domain.Announcement;
import com.gms.gms.domain.Teacher;
import com.gms.gms.service.AccountService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@Validated
@RestController
@RequestMapping("account")
public class AccountController {
    //todo 角色的增删改查
    @Autowired
    AccountService accountService;

    //查询返回所有的老师
    @GetMapping("/plea/teacher")
    public GmsResponse searchTeacherInf(int page, int size) throws GmsException{
        try {
            IPage<Teacher> announcement = accountService.getAllTeacher(page,size);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"), announcement);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }
}

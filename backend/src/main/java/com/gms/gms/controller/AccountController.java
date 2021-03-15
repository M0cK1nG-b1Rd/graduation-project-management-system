package com.gms.gms.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.gms.domain.Student;
import com.gms.gms.domain.Teacher;
import com.gms.gms.service.AccountService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Slf4j
@Validated
@RestController
@RequestMapping("account")
public class AccountController {
    //todo 角色的增删改查
    @Autowired
    AccountService accountService;

    //进行答辩分组前查询返回所有的老师
    @GetMapping("/plea/teacher")
    public GmsResponse searchTeacherInf(int page, int size) throws GmsException{
        try {
            Page<Teacher> teacherPage = accountService.getAllTeacher(page,size);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"), teacherPage);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    //进行答辩分组前返回所有的有资格学生
    @GetMapping("/plea/student")
    public GmsResponse searchStudentTInf(int page, int size, String stage) throws GmsException{
        try {
            Page<Student> studentPage = accountService.getAllStudent(page,size,stage);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"), studentPage);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    //老师的自动分组
    @PostMapping("/plea/teacher")
    public GmsResponse groupTeacherAuto(Integer teamSize,String stage) throws GmsException{
        try {
            accountService.groupTeacherAuto(teamSize,stage);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "新建老师分组成功"));
        } catch (Exception e) {
            String message = "新建失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }
}

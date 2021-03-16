package com.gms.gms.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.gms.domain.Student;
import com.gms.gms.domain.Teacher;
import com.gms.gms.domain.TeacherTeam;
import com.gms.gms.service.AccountService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@Validated
@RestController
@RequestMapping("account")
public class AccountController {
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
            if(accountService.selectStageInTeam(stage,"acceptance_team")>0){
                return new GmsResponse().addCodeMessage(new Meta(
                        Code.C500.getCode(),
                        Code.C500.getDesc(),
                        "已经自动生成分组"));
            }
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

    //返回老师的分组结果，支持分页，需要传参阶段
    @GetMapping("/plea/teacherTeam")
    public GmsResponse searchTeacherTeamInf(int page, int size, String status) throws GmsException{
        try {
            Page<TeacherTeam> teacherTeamPage = accountService.getTeacherTeam(page,size,status);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"), teacherTeamPage);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }
}

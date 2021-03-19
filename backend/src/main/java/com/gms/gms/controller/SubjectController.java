package com.gms.gms.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.common.utils.GmsUtil;
import com.gms.gms.domain.AppliedSubject;
import com.gms.gms.domain.Subject;
import com.gms.gms.domain.Teacher;
import com.gms.gms.service.AccountService;
import com.gms.gms.service.SubjectService;
import com.gms.gms.service.impl.SubjectServiceImpl;
import com.gms.gms.utils.AccountUtil;
import com.gms.gms.utils.FileStorageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * @author MrBird
 */
@Slf4j
@Validated
@RestController
@RequestMapping("subject")
public class SubjectController {
    @Autowired
    SubjectService subjectService;
    @Autowired
    AccountService accountService;

    //教师查看自己的课题
    @GetMapping("teacher/my")
    public GmsResponse getMySubject(@RequestParam(required = false) String subId) throws GmsException {
        try {
            List<Subject> subjects = subjectService.getMySubject(subId);
            return new GmsResponse().addCodeMessage(new Meta(Code.C200.getCode(), Code.C200.getDesc(), "查询成功"), subjects);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    //学生查看自己申请通过的课题
    @GetMapping("student/my")
    public GmsResponse getStudentPassedSubject() throws GmsException {
        try {
            Integer stuId = AccountUtil.getCurrentStudent().getStuId();
            Subject subject = subjectService.getStudentPassedSubject(stuId);
            return new GmsResponse().addCodeMessage(new Meta(Code.C200.getCode(), Code.C200.getDesc(), "查询成功"), subject);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    /**
     *通过userid返回当前学生的课题信息，restful传参
     *stuId:学生id
     */
    @GetMapping("studentId/#{userId}")
    public GmsResponse getStudentPassedSubjectById(@PathVariable Integer userId) throws GmsException {
        try {
            Subject subject = subjectService.getStudentPassedSubject(accountService.getStudentByUserId(userId).getStuId());
            return new GmsResponse().addCodeMessage(new Meta(Code.C200.getCode(), Code.C200.getDesc(), "查询成功"), subject);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    //学生查看选题信息，包括详情
    //passed是指教师通过的课题而不是学生通过的课题
    //筛选 搜索关键字、课题领域、老师名字
    @GetMapping
    public GmsResponse getPassedSubject(Subject subject) throws GmsException{
        try {

            IPage<Subject> applyList = subjectService.getPassedSubject(subject);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"),applyList);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    @GetMapping("all")
    public GmsResponse getAllSubject(Subject subject) throws GmsException{
        try {
            IPage<Subject> applyList = subjectService.getAllSubject(subject);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"),applyList);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }



    //教师出题
    @PostMapping
    public GmsResponse giveSubject(@RequestBody Subject subject) throws GmsException {
        try {
            String docId=FileStorageUtil.getDocId();
            subject.setSubId(docId);
            subject.setPoseBy(AccountUtil.getCurrentTeacher().getTeacherId());
            subject.setPoseTime(new Date());
            subjectService.save(subject);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "新建课题成功"),docId);
        } catch (Exception e) {
            String message = "新建课题失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    //教师课题被驳回后修改课题
    @PostMapping("modify")
    public GmsResponse modifySubject(@RequestBody Subject subject) throws GmsException {
        try {
            //新建一条记录而不是修改记录
            subject.setPoseBy(GmsUtil.getCurrentUser().getUserId());
            String docId = FileStorageUtil.getDocId();
            subject.setDocId(docId);
            subjectService.save(subject);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "修改课题成功"),docId);
        } catch (Exception e) {
            String message = "修改课题失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    //教研办审核教师课题
    @PutMapping("audit")
    public GmsResponse auditSubject(LinkedHashMap<String,String> opinion) throws GmsException {
        try {
            String docId = opinion.get("docId");
            //WTG未通过，YTG已通过
            String status = opinion.get("status");
            String feedback = opinion.get("feedback");
            subjectService.giveOpinion(docId, status, feedback);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "审核成功"));
        } catch (Exception e) {
            String message = "审核失败";
            log.error(message, e);
            throw new GmsException(message);
        }




    }

    @DeleteMapping()
    public GmsResponse deleteSubject(String subId) throws GmsException {
        try {
            subjectService.deleteSubject(subId);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "删除课题成功"));
        } catch (Exception e) {
            String message = "删除课题失败";
            log.error(message, e);
            throw new GmsException(message);
        }

    }
    @GetMapping("track/{subId}")
    public GmsResponse trackSubject(@PathVariable String subId) throws GmsException {
        try {
            List<Subject> subjectList = subjectService.trackSubject(subId);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"),
                    subjectList);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }



    }
}

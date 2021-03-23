package com.gms.gms.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.common.utils.GmsUtil;
import com.gms.gms.domain.Announcement;
import com.gms.gms.domain.AppliedSubject;
import com.gms.gms.domain.Student;
import com.gms.gms.domain.Subject;
import com.gms.gms.service.AppliedSubjectService;
import com.gms.gms.service.SubjectService;
import com.gms.gms.utils.AccountUtil;
import com.gms.gms.utils.FileStorageUtil;
import io.swagger.models.auth.In;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * @author MrBird
 */
@Slf4j
@Validated
@RestController
@RequestMapping("subject")
public class AppliedSubjectController {
    @Autowired
    AppliedSubjectService appliedSubjectService;

    @Autowired
    SubjectService subjectService;

    //不同角色调用同一接口将返回不同结果

    @GetMapping("apply")
    public GmsResponse getAppliedSubject(AppliedSubject appliedSubject) throws GmsException {
        try {
            //默认使用第一个角色，即取第一个角色的名字
            String roleName = GmsUtil.getUserRoles().get(0).getRoleName();

            IPage<AppliedSubject> applyList = appliedSubjectService.selectWithCondition(appliedSubject, roleName);

            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"), applyList);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    //查看指定课题的所有学生
    @GetMapping("students")
    public GmsResponse getStudentsInSubject(String subId) throws GmsException {
        try {
            List<Student> subjects = appliedSubjectService.getStudentsInSubject(subId);
            return new GmsResponse().addCodeMessage(new Meta(Code.C200.getCode(), Code.C200.getDesc(), "查询成功"), subjects);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    //查看教师带的所有学生
    @GetMapping("students/all")
    public GmsResponse getStudentsOfTeacher() throws GmsException {
        try {
            List<Student> subjects = appliedSubjectService.getStudentsOfTeacher();
            return new GmsResponse().addCodeMessage(new Meta(Code.C200.getCode(), Code.C200.getDesc(), "查询成功"), subjects);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }


    @PostMapping("apply")
    public GmsResponse addAppliedSubject(@RequestBody AppliedSubject appliedSubject) throws GmsException {
        try {
            appliedSubject.setStuId(AccountUtil.getCurrentStudent().getStuId());
            appliedSubject.setApplyTime(new Date());
            String docId = FileStorageUtil.getDocId();
            appliedSubject.setDocId(docId);
            appliedSubjectService.addAppliedSubject(appliedSubject);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "选题申请提交成功"), docId);
        } catch (GmsException e) {
            String message = "选题申请提交失败";
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C500.getCode(),
                    Code.C500.getDesc(),
                    message + " : " + e.getMessage()));
        } catch (Exception e) {
            String message = "选题申请提交失败";
            throw new GmsException(message);
        }
    }

    // 教师通过或驳回学生的选题申请
    // TODO: 2021/3/23 选题通过则增加选课人数
    @PutMapping("apply")
    public GmsResponse auditAppliedSubject(@RequestBody AppliedSubject appliedSubject) throws GmsException {
        try {
            if ("YTG".equals(appliedSubject.getStatus()) &&
                    appliedSubjectService.count(new QueryWrapper<AppliedSubject>().lambda()
                            .eq(AppliedSubject::getStudentId, appliedSubject.getStudentId())
                            .eq(AppliedSubject::getStatus, "YTG")) > 0) {
                return new GmsResponse().addCodeMessage(new Meta(
                        Code.C500.getCode(),
                        Code.C500.getDesc(),
                        "该学生已经有通过课题，请驳回该申请"));
            }
            //人数已满则驳回申请

            // TODO: 2021/3/23
            Integer stuCount = appliedSubjectService.getStudentsInSubject(appliedSubject.getSubId()).size();
//            subjectService.getBySubId(appliedSubject.getSubId()).setChosen();


            appliedSubject.setAuditTime(new Date());
            appliedSubjectService.auditAppliedSubject(appliedSubject);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "审核意见提交成功"));
        } catch (Exception e) {
            String message = "审核意见提交失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }
}

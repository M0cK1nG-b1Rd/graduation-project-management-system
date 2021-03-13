package com.gms.gms.controller;


import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.common.utils.GmsUtil;
import com.gms.gms.domain.Subject;
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
    SubjectServiceImpl subjectService;

    @GetMapping
    public GmsResponse getSubject() throws GmsException {
        try {
            List<Subject> subjects = subjectService.getSubject();
            return new GmsResponse().addCodeMessage(new Meta(Code.C200.getCode(), Code.C200.getDesc(), "查询成功"), subjects);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    @PostMapping
    public GmsResponse giveSubject(@RequestBody Subject subject) throws GmsException {
        try {
            subject.setSubId(FileStorageUtil.getDocId());
            subject.setPoseBy(AccountUtil.getCurrentTeacher().getTeacherId());
            subject.setPoseTime(new Date());
            subjectService.save(subject);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "新建课题成功"));
        } catch (Exception e) {
            String message = "新建课题失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    @PostMapping("modify")
    public GmsResponse modifySubject(Subject subject) throws GmsException {
        try {
            //新建一条记录而不是修改记录
            subject.setPoseBy(GmsUtil.getCurrentUser().getUserId());
            String uuid = FileStorageUtil.getDocId();
            subject.setDocId(uuid);
            subjectService.save(subject);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "修改课题成功"));
        } catch (Exception e) {
            String message = "修改课题失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    @PutMapping("audit")
    public GmsResponse auditSubject(LinkedHashMap<String,String> opinion) throws GmsException {
        try {
            String docId = opinion.get("docId");
            Boolean isPassed = opinion.get("isPassed").equals("1");
            String feedback = opinion.get("feedback");
            subjectService.giveOpinion(docId, isPassed, feedback);
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

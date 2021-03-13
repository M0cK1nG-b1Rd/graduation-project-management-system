package com.gms.gms.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.gms.domain.Announcement;
import com.gms.gms.domain.AppliedSubject;
import com.gms.gms.service.AppliedSubjectService;
import com.gms.gms.utils.AccountUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author MrBird
 */
@Slf4j
@Validated
@RestController
@RequestMapping("subject/apply")
public class AppliedSubjectController {
    @Autowired
    AppliedSubjectService appliedSubjectService;

    //教研办或老师获取学生申请课题的情况
    @GetMapping
    public GmsResponse getAppliedSubject(AppliedSubject appliedSubject) throws GmsException{
        try {
            //todo
            IPage<AppliedSubject> applyList = appliedSubjectService.selectWithCondition(appliedSubject);

            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"));
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }


    @PostMapping
    public GmsResponse applyForSubject(String subId) throws GmsException {
        try {
            AppliedSubject appliedSubject = new AppliedSubject();
            appliedSubject.setSubId(subId);
            appliedSubject.setStuId(AccountUtil.getCurrentStudent().getStuId());
            appliedSubjectService.submitAppliance(appliedSubject);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "选题申请提交成功"));
        } catch (Exception e) {
            String message = "选题申请提交失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    //需要id is_passed feedback
    @PutMapping("audit")
    public GmsResponse auditAppliedSubject(AppliedSubject appliedSubject) throws GmsException {
        try {
            //代表已经审核
            appliedSubject.setStatus(1);
            appliedSubjectService.auditAppliance(appliedSubject);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "提交成功"));
        } catch (Exception e) {
            String message = "提交失败";
            log.error(message, e);
            throw new GmsException(message);
        }

    }

}

package com.gms.gms.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.common.utils.GmsUtil;
import com.gms.gms.domain.Announcement;
import com.gms.gms.domain.AppliedSubject;
import com.gms.gms.service.AppliedSubjectService;
import com.gms.gms.utils.AccountUtil;
import com.gms.gms.utils.FileStorageUtil;
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
@RequestMapping("subject/apply")
public class AppliedSubjectController {
    @Autowired
    AppliedSubjectService appliedSubjectService;

    //不同角色调用同一接口将返回不同结果
    @GetMapping
    public GmsResponse getAppliedSubject(AppliedSubject appliedSubject) throws GmsException{
        try {
            //默认使用第一个角色，即取第一个角色的名字
            String roleName = GmsUtil.getUserRoles().get(0).getRoleName();

            IPage<AppliedSubject> applyList = appliedSubjectService.selectWithCondition(appliedSubject,roleName);

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

    @PostMapping
    public GmsResponse addAppliedSubject(@RequestBody AppliedSubject appliedSubject) throws GmsException{
        try {
            appliedSubject.setStuId(AccountUtil.getCurrentStudent().getStuId());
            appliedSubject.setApplyTime(new Date());
            appliedSubject.setDocId(FileStorageUtil.getDocId());
            appliedSubjectService.addAppliedSubject(appliedSubject);
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

    @PutMapping
    public GmsResponse auditAppliedSubject(@RequestBody AppliedSubject appliedSubject) throws GmsException{
        try {
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

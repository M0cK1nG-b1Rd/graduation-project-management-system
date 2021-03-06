package com.gms.gms.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.common.utils.GmsUtil;
import com.gms.gms.domain.AppliedSubject;
import com.gms.gms.domain.Report;
import com.gms.gms.service.AccountService;
import com.gms.gms.service.ReportService;
import com.gms.gms.utils.AccountUtil;
import com.gms.gms.utils.FileStorageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.xml.ws.Action;
import java.util.Date;
import java.util.List;
import java.util.LinkedHashMap;

/**
 * @author MrBird
 */
@Slf4j
@Validated
@RestController
@RequestMapping("report")
public class ReportController {

    // TODO: 2021/3/24   从这往上配完权限
    @Autowired
    ReportService reportService;

    @Autowired
    AccountService accountService;

    @GetMapping
    public GmsResponse getReport(Report report) throws GmsException {
        try {
            //默认使用第一个角色，即取第一个角色的名字
            String roleName = GmsUtil.getUserRoles().get(0).getRoleName();

            // 需要传参课题的阶段，进行筛选
            IPage<Report> applyList = reportService.selectReport(report,roleName);

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

    //根据userId和stage返回成果
    @GetMapping("/user")
    public GmsResponse getReportByUser(Integer userId, String stage) throws GmsException {
        try {
            Integer stuId = accountService.getStudentByUserId(userId).getStuId();
            List<Report> apply = reportService.selectReportByStuId(stuId,stage);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"),apply);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }



    @PostMapping
    public GmsResponse addReport(@RequestBody Report report) throws GmsException {
        try {
            String docId = FileStorageUtil.getDocId();
            report.setDocId(docId);
            report.setPoseBy(AccountUtil.getCurrentStudent().getStuId());
            report.setPoseTime(new Date());
            reportService.addReport(report);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "提交报告成功"),docId);
        } catch (GmsException e) {
            String message = "提交报告失败";
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C500.getCode(),
                    Code.C500.getDesc(),
                    message + " : " + e.getMessage()));
        }catch (Exception e) {
            String message = "提交报告失败";
            log.error(message, e);
            throw new GmsException(message);
        }

    }


    //包括给反馈，打分
    @PutMapping
    public GmsResponse auditReport(@RequestBody Report report) throws GmsException {
        try {
            report.setAuditBy(AccountUtil.getCurrentTeacher().getTeacherId());
            report.setAuditTime(new Date());
            reportService.auditReport(report);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "审核信息提交成功"));
        } catch (GmsException e) {
            String message = "审题信息提交失败";
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C500.getCode(),
                    Code.C500.getDesc(),
                    message + " : " + e.getMessage()));
        }catch (Exception e) {
            String message = "审核信息提交失败";
            log.error(message, e);
            throw new GmsException(message);
        }

    }

}

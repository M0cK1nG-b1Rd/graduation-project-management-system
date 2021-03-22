package com.gms.system.aspect;

import com.alibaba.fastjson.JSONObject;
import com.gms.gms.domain.AppliedSubject;
import com.gms.gms.domain.Report;
import com.gms.system.utils.CreatNewMessage;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import java.util.LinkedHashMap;

@Slf4j
@Aspect
@Component
public class MessageAspect {

    /**
     * 答辩安排的相应通知切点
     */
    @AfterReturning(value = "execution(* com.gms.gms.controller.PleaController.updatePleaReleaseTure(com.alibaba.fastjson.JSONObject)) && args(jsonObject)", argNames = "jsonObject")
    public void afterUpdatePleaReleaseTure(JSONObject jsonObject) {
        new CreatNewMessage().creatNewPleaOne(jsonObject.getString("stage"));
    }

    @AfterReturning(value = "execution(* com.gms.gms.controller.PleaController.updatePleaReleaseFalse(com.alibaba.fastjson.JSONObject)) && args(jsonObject)", argNames = "jsonObject")
    public void afterUpdatePleaReleaseFalse(JSONObject jsonObject) {
        new CreatNewMessage().creatNewPleaTwo(jsonObject.getString("stage"));
    }

    @AfterReturning(value = "execution(* com.gms.gms.controller.PleaController.deletePleaRelease(java.lang.String)) && args(stage)", argNames = "stage")
    public void afterUpdatePleaReleaseFalse(String stage) {
        new CreatNewMessage().creatNewPleaTwo(stage);
    }

    /**
     * 学生选题状态更新通知切点
     */
    @AfterReturning(value = "execution(* com.gms.gms.controller.AppliedSubjectController.auditAppliedSubject(com.gms.gms.domain.AppliedSubject)) && args(appliedSubject)", argNames = "appliedSubject")
    public void afterAuditAppliedSubject(AppliedSubject appliedSubject) {
        new CreatNewMessage().creatNewStudentAppliedSubject(appliedSubject.getStudentId());
    }

    /**
     * 老师的课题申请状态更新切点
     */
    /*@AfterReturning(value = "execution(* com.gms.gms.controller.SubjectController.auditSubject(java.util.LinkedHashMap)) && args(opinion)",argNames = "opinion")
    public void afterAuditSubject(LinkedHashMap<String,String> opinion) {
        new CreatNewMessage().creatNewAuditSubject(opinion.get("subId"));
    }*/

    /**
     *开题和中期阶段成果打分后的自动通知信息
     */
    /*@AfterReturning(value = "execution(* com.gms.gms.controller.ReportController.auditReport(com.gms.gms.domain.Report)) && args(report)",argNames = "report")
    public void afterAuditReport(Report report) {
        new CreatNewMessage().creatNewAuditReport(report.getId());
    }*/

    /**
     * 论文安排发布后的自动通知
     */
    @AfterReturning(value = "execution(* com.gms.gms.controller.ThesisTeacherController.updateThesisGroupStage())")
    public void afterUpdateThesisGroupStage() {
        new CreatNewMessage().afterUpdateThesisGroupStage();
    }

    /**
     * 论文安排删除前的自动通知
     */
    @Before(value = "execution(* com.gms.gms.controller.ThesisTeacherController.deleteThesisGroupStage())")
    public void beforeDeleteThesisGroupStage() {
        new CreatNewMessage().beforeDeleteThesisGroupStage();
    }

    /**
     * 老师论文打分后的自动通知和结果统计
     */
    /*@AfterReturning(value = "execution(* com.gms.gms.controller.ThesisTeacherController.scoreThesisGroupStage())")
    public void afterUpdateThesisGroupStage() {
        new CreatNewMessage().afterUpdateThesisGroupStage();
    }*/
}

package com.gms.system.aspect;

import com.alibaba.fastjson.JSONObject;
import com.gms.gms.domain.*;
import com.gms.system.utils.CreatNewMessage;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import java.util.List;

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

    @Before(value = "execution(* com.gms.gms.controller.PleaController.deletePleaRelease(java.lang.String)) && args(stage)", argNames = "stage")
    public void afterUpdatePleaReleaseFalse(String stage) {
        new CreatNewMessage().creatNewPleaTwo(stage);
    }

    /**
     * 答辩出分通知切点
     */
    @AfterReturning(value = "execution(* com.gms.gms.controller.PleaResultController.addNewPleaResult(com.gms.gms.domain.PleaResult)) && args(pleaResult)", argNames = "pleaResult")
    public void afterAddNewPleaResult(PleaResult pleaResult) {
        new CreatNewMessage().afterAddNewPleaResult(pleaResult.getUserId(), pleaResult.getStage());
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
    @AfterReturning(value = "execution(* com.gms.gms.controller.SubjectController.auditSubject(com.gms.gms.domain.Subject)) && args(opinion)", argNames = "opinion")
    public void afterAuditSubject(Subject opinion) {
        new CreatNewMessage().afterAuditSubject(opinion.getSubId());
    }

    /**
     * 开题和中期阶段成果打分后的自动通知信息
     */
    @AfterReturning(value = "execution(* com.gms.gms.controller.ReportController.auditReport(com.gms.gms.domain.Report)) && args(report)", argNames = "report")
    public void afterAuditReport(Report report) {
        new CreatNewMessage().afterAuditReport(report.getId());
    }

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
    @AfterReturning(value = "execution(* com.gms.gms.controller.ThesisTeacherController.scoreThesisGroupStage(com.gms.gms.domain.ThesisTeacher)) && args(thesisTeacher)", argNames = "thesisTeacher")
    public void afterScoreThesisGroupStage(ThesisTeacher thesisTeacher) {
        new CreatNewMessage().afterScoreThesisGroupStage(thesisTeacher.getId());
    }

    /**
     * 学生申请课题后向老师发通知
     */
    @AfterReturning(value = "execution(* com.gms.gms.controller.AppliedSubjectController.addAppliedSubject(com.gms.gms.domain.AppliedSubject)) && args(appliedSubject)", argNames = "appliedSubject")
    public void afterAddAppliedSubject(AppliedSubject appliedSubject) {
        new CreatNewMessage().afterAddAppliedSubject(appliedSubject.getSubId());
    }

    /**
     * 系统阶段变更时向所有用户发送通知
     */
    @AfterReturning(value = "execution(* com.gms.gms.controller.SystemStageController.updateSystemStage(java.util.List)) && args(currStageIds)", argNames = "currStageIds")
    public void afterUpdateSystemStage(List<Integer> currStageIds) {
        if (currStageIds.size() > 0) {
            new CreatNewMessage().afterUpdateSystemStage(currStageIds);
        }
    }

    /**
     * 老师布置阶段任务时向学生发通知
     */
    @AfterReturning(value = "execution(* com.gms.gms.controller.StageTaskController.giveStageTask(com.gms.gms.domain.StageTask)) && args(task)", argNames = "task")
    public void afterGiveStageTask(StageTask task) {
        new CreatNewMessage().afterGiveStageTask(task.getTaskId());
    }

    /**
     * 学生提交阶段成果时向老师发送通知
     */
    @AfterReturning(value = "execution(* com.gms.gms.controller.StageTaskResultController.giveStageTaskResult(com.gms.gms.domain.StageTaskResult)) && args(result)", argNames = "result")
    public void afterGiveStageTaskResult(StageTaskResult result) {
        new CreatNewMessage().afterGiveStageTaskResult(result.getTaskId());
    }

    /**
     * 老师阶段成果批复后向学生发送通知
     */
    @AfterReturning(value = "execution(* com.gms.gms.controller.StageTaskResultController.giveStageTaskScore(com.gms.gms.domain.StageTaskResult)) && args(result)", argNames = "result")
    public void afterGiveStageTaskScore(StageTaskResult result) {
        new CreatNewMessage().afterGiveStageTaskScore(result.getTaskId());
    }
}

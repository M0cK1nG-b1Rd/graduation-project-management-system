package com.gms.gms.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.common.utils.GmsUtil;
import com.gms.gms.domain.StageTaskResult;
import com.gms.gms.service.StageTaskResultService;
import com.gms.gms.service.StageTaskService;
import com.gms.gms.utils.AccountUtil;
import com.gms.gms.utils.FileStorageUtil;
import io.swagger.models.auth.In;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

/**
 * @author MrBird
 */
@Slf4j
@Validated
@RestController
@RequestMapping("stage/task")
public class StageTaskResultController {

    @Autowired
    StageTaskResultService stageTaskResultService;

    @Autowired
    StageTaskService stageTaskService;




    @PostMapping("result")
    public GmsResponse giveStageTaskResult(@RequestBody StageTaskResult result) throws GmsException {
        try {
            String docId = FileStorageUtil.getDocId();
            result.setDocId(docId);

            Integer currRetries = stageTaskResultService.getRetriesTime(result.getTaskId());
            // 重复次数加1
            result.setRetries(currRetries + 1);
            stageTaskResultService.giveStageTaskResult(result);
            //更新状态为待审核
            stageTaskResultService.changeStatus(result.getTaskId(),"DSH");
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "提交阶段任务成果成功"),docId);
        } catch (Exception e) {
            String message = "提交阶段任务成果失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }


    @GetMapping("result")
    public GmsResponse getStageTaskResult(StageTaskResult result) throws GmsException {
        try {
            //默认使用第一个角色，即取第一个角色的名字
            String roleName = GmsUtil.getUserRoles().get(0).getRoleName();
            IPage<StageTaskResult> stageTaskList =  stageTaskResultService.getStageTaskResult(result,roleName);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"),stageTaskList);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }


    //老师查看阶段任务总体提交情况
    @GetMapping("handin")
    public GmsResponse getGeneralStageTaskResult(StageTaskResult result) throws GmsException {
        try {
            IPage<StageTaskResult> stageTaskList =  stageTaskResultService.getGeneralStageTaskResult(result);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"),stageTaskList);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }


//    @PutMapping("result")
//    public GmsResponse modifyStageTaskResult(@RequestBody StageTaskResult result) throws GmsException {
//        try {
//            stageTaskResultService.modifyStageTaskResult(result);
//            return new GmsResponse().addCodeMessage(new Meta(
//                    Code.C200.getCode(),
//                    Code.C200.getDesc(),
//                    "修改阶段任务成功"));
//        } catch (Exception e) {
//            String message = "修改阶段任务失败";
//            log.error(message, e);
//            throw new GmsException(message);
//        }
//    }

    @PutMapping("result/score")
    public GmsResponse giveStageTaskScore(@RequestBody StageTaskResult result) throws GmsException {
        try {
            result.setAuditTime(new Date());
            stageTaskResultService.giveStageTaskScore(result);
            stageTaskResultService.changeStatus(result.getTaskId(),result.getStatus());
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "提交打分成功"));
        } catch (Exception e) {
            String message = "提交打分失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

}

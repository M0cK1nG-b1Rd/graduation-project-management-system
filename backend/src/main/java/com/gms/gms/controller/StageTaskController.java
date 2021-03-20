package com.gms.gms.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.common.utils.GmsUtil;
import com.gms.gms.domain.StageTask;
import com.gms.gms.service.StageTaskService;
import com.gms.gms.utils.AccountUtil;
import com.gms.gms.utils.FileStorageUtil;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.ApiStatus;
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
public class StageTaskController {

    @Autowired
    StageTaskService stageTaskService;

    @PostMapping
    public GmsResponse giveStageTask(@RequestBody StageTask task) throws GmsException {
        try {
            Integer teacherId = AccountUtil.getCurrentTeacher().getTeacherId();
            task.setTeacherId(teacherId);
            String docId = FileStorageUtil.getDocId();
            task.setDocId(docId);
            stageTaskService.addStageTask(task);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "布置阶段任务成功"),docId);
        } catch (Exception e) {
            String message = "布置阶段任务失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }


    @GetMapping
    public GmsResponse getStageTask(StageTask task) throws GmsException {
        try {
            //默认使用第一个角色，即取第一个角色的名字
            String roleName = GmsUtil.getUserRoles().get(0).getRoleName();
            IPage<StageTask> stageTaskList =  stageTaskService.getStageTask(task,roleName);
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

    // TODO: 2021/3/18 测试 
    @PutMapping
    public GmsResponse modifyStageTask(@RequestBody StageTask task) throws GmsException {
        try {
            stageTaskService.modifyStageTask(task);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "修改阶段任务成功"));
        } catch (Exception e) {
            String message = "修改阶段任务失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }
}



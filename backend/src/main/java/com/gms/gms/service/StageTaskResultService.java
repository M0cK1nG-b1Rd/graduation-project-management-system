package com.gms.gms.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gms.common.exception.GmsException;
import com.gms.gms.domain.StageTaskResult;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author MrBird
 */
public interface StageTaskResultService extends IService<StageTaskResult> {

    void giveStageTaskResult(StageTaskResult task);

    IPage<StageTaskResult> getStageTaskResult(StageTaskResult task, String roleName) throws GmsException;

    void modifyStageTaskResult(StageTaskResult task);

    void giveStageTaskScore(StageTaskResult task);

    void changeStatus(Integer taskId, String status);

    Integer getRetriesTime(Integer taskId);

    IPage<StageTaskResult> getGeneralStageTaskResult(StageTaskResult result) throws GmsException;
}

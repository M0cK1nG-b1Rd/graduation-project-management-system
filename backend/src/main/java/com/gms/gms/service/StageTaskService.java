package com.gms.gms.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gms.common.exception.GmsException;
import com.gms.gms.domain.StageTask;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author MrBird
 */
public interface StageTaskService extends IService<StageTask> {

    void addStageTask(StageTask task);

    IPage<StageTask> getStageTask(StageTask task, String roleName) throws GmsException;

    void modifyStageTask(StageTask task);
}

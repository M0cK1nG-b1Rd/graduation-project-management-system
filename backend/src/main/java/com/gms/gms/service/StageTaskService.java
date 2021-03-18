package com.gms.gms.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gms.gms.domain.StageTask;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author MrBird
 */
public interface StageTaskService extends IService<StageTask> {

    void addStageTask(StageTask task);

    IPage<StageTask> getStageTask(StageTask task);

    void modifyStageTask(StageTask task);
}

package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.StageTaskResult;
import com.gms.gms.dao.StageTaskResultMapper;
import com.gms.gms.service.StageTaskResultService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author MrBird
 */
@Service
public class StageTaskResultServiceImpl extends ServiceImpl<StageTaskResultMapper, StageTaskResult> implements StageTaskResultService {

    @Override
    public void giveStageTaskResult(StageTaskResult task) {
        this.save(task);
    }

    @Override
    public IPage<StageTaskResult> getStageTaskResult(StageTaskResult task) {
        Page<StageTaskResult> page = new Page<>(task==null?task.getPage():1,task==null?task.getSize():Integer.MAX_VALUE);

        return this.baseMapper.getStageTaskResult(page,task);
    }

    @Override
    public void modifyStageTaskResult(StageTaskResult task) {

    }

    @Override
    public void giveStageTaskScore(StageTaskResult task) {

    }

    @Override
    public void changeStatus(Integer taskId, String status) {
        this.baseMapper.changeStatus(taskId,status);
    }
}

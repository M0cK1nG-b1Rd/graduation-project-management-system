package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.Report;
import com.gms.gms.domain.StageTask;
import com.gms.gms.dao.StageTaskMapper;
import com.gms.gms.service.StageTaskService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author MrBird
 */
@Service
public class StageTaskServiceImpl extends ServiceImpl<StageTaskMapper, StageTask> implements StageTaskService {

    @Override
    public void addStageTask(StageTask task) {
        this.save(task);
    }

    @Override
    public IPage<StageTask> getStageTask(StageTask task) {
        // TODO: 2021/3/18 增加权限校验
        Page<StageTask> page = new Page<>(task==null?task.getPage():1,task==null?task.getSize():Integer.MAX_VALUE);

        return this.baseMapper.getStageTask(page,task);
    }

    @Override
    public void modifyStageTask(StageTask task) {
        this.updateById(task);
    }
}

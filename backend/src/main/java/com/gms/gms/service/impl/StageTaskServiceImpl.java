package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.common.exception.GmsException;
import com.gms.gms.domain.StageTask;
import com.gms.gms.dao.StageTaskMapper;
import com.gms.gms.service.StageTaskService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gms.gms.utils.AccountUtil;
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
    public IPage<StageTask> getStageTask(StageTask task, String roleName) throws GmsException {
        // TODO: 2021/3/18 增加权限校验
        Page<StageTask> page = new Page<>(task==null?task.getPage():1,task==null?task.getSize():Integer.MAX_VALUE);
        Page<StageTask> stageTaskPage;

        //区分不同角色并调用不同的方法
        if(roleName.equals("管理员") || roleName.equals("系办")){
            stageTaskPage = this.baseMapper.getStageTask(page,task);
        }else if(roleName.equals("老师")){
            Integer teacherId = AccountUtil.getCurrentTeacher().getTeacherId();
            stageTaskPage = this.baseMapper.getStageTaskAsTeacher(page,task,teacherId);

        }else {
            //学生
            Integer studentId = AccountUtil.getCurrentStudent().getStuId();
            stageTaskPage = this.baseMapper.getStageTaskAsStudent(page,task,studentId);
        }

        return stageTaskPage;
    }

    @Override
    public void modifyStageTask(StageTask task) {
        this.updateById(task);
    }
}

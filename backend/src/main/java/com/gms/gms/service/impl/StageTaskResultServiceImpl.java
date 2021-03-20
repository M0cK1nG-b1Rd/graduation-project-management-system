package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.common.exception.GmsException;
import com.gms.gms.domain.StageTaskResult;
import com.gms.gms.dao.StageTaskResultMapper;
import com.gms.gms.service.StageTaskResultService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gms.gms.utils.AccountUtil;
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
    public IPage<StageTaskResult> getStageTaskResult(StageTaskResult task, String roleName) throws GmsException {
        Page<StageTaskResult> page = new Page<>(task==null?task.getPage():1,task==null?task.getSize():Integer.MAX_VALUE);
        Page<StageTaskResult> stageTaskResultPage;

        //区分不同角色并调用不同的方法
        if(roleName.equals("管理员") || roleName.equals("系办")){
            stageTaskResultPage = this.baseMapper.getStageTaskResult(page,task);
        }else if(roleName.equals("老师")){
            Integer teacherId = AccountUtil.getCurrentTeacher().getTeacherId();
            stageTaskResultPage = this.baseMapper.getStageTaskResultAsTeacher(page,task,teacherId);

        }else {
            //学生
            Integer studentId = AccountUtil.getCurrentStudent().getStuId();
            stageTaskResultPage = this.baseMapper.getStageTaskResultAsStudent(page,task,studentId);
        }
        return stageTaskResultPage;
    }

    @Override
    public void modifyStageTaskResult(StageTaskResult task) {
        // TODO: 2021/3/20
    }

    @Override
    public void giveStageTaskScore(StageTaskResult task) {
        this.baseMapper.giveStageTaskScore(task);
    }

    @Override
    public void changeStatus(Integer taskId, String status) {
        this.baseMapper.changeStatus(taskId,status);
    }

    @Override
    public Integer getRetriesTime(Integer taskId) {
        return this.baseMapper.getRetriesTime(taskId);
    }
}

package com.gms.gms.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.StageTask;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * @author MrBird
 */
public interface StageTaskMapper extends BaseMapper<StageTask> {

    Page<StageTask> getStageTask(Page<StageTask> page, StageTask task);

    Page<StageTask> getStageTaskAsTeacher(Page<StageTask> page, StageTask task, Integer teacherId);

    Page<StageTask> getStageTaskAsStudent(Page<StageTask> page, StageTask task, Integer studentId);
}

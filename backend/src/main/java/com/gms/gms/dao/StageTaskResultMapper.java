package com.gms.gms.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.StageTaskResult;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * @author MrBird
 */
public interface StageTaskResultMapper extends BaseMapper<StageTaskResult> {

    Page<StageTaskResult> getStageTaskResultAsStudent(Page<StageTaskResult> page ,StageTaskResult task, Integer stuId);

    void changeStatus(Integer taskId,String status);

    Integer getRetriesTime(Integer taskId);

    void giveStageTaskScore(@Param("task") StageTaskResult task);

    Page<StageTaskResult> getStageTaskResult(Page<StageTaskResult> page, StageTaskResult task);

    Page<StageTaskResult> getStageTaskResultAsTeacher(Page<StageTaskResult> page, StageTaskResult task, Integer teacherId);
}

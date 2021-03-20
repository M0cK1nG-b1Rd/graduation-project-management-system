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

    IPage<StageTaskResult> getStageTaskResult(Page<StageTaskResult> page ,Integer stuId);

    void changeStatus(Integer taskId,String status);

    Integer getRetriesTime(Integer taskId);

    void giveStageTaskScore(@Param("task") StageTaskResult task);
}

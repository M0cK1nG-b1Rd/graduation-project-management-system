package com.gms.gms.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.StageTaskResult;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * @author MrBird
 */
public interface StageTaskResultMapper extends BaseMapper<StageTaskResult> {

    IPage<StageTaskResult> getStageTaskResult(Page<StageTaskResult> page, StageTaskResult task);

    void changeStatus(Integer taskId);
}

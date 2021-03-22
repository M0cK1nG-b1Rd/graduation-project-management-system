package com.gms.gms.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.StageTaskResult;
import com.gms.gms.domain.TotalScore;
import org.apache.ibatis.annotations.Param;

/**
 * @author MrBird
 */
public interface TotalScoreMapper extends BaseMapper<TotalScore> {

    TotalScore getAllScore(Integer stuId);
}

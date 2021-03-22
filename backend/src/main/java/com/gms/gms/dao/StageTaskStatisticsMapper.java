package com.gms.gms.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.Report;
import com.gms.gms.domain.StageTaskStatistics;
import com.gms.gms.domain.StageTaskStatisticsDetail;

import java.util.List;

/**
 * @author MrBird
 */
public interface StageTaskStatisticsMapper extends BaseMapper<StageTaskStatistics> {

    StageTaskStatistics getSummaryStatistics(Integer stuId);

    List<StageTaskStatisticsDetail> getSummaryStatisticsDetail(Integer stuId);
}

package com.gms.gms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.gms.gms.domain.PleaResult;
import com.gms.gms.domain.StageTaskStatistics;
import com.gms.gms.domain.StageTaskStatisticsDetail;

import java.util.List;

/**
 * @author MrBird
 */
public interface StageTaskStatisticsService extends IService<StageTaskStatistics> {

    StageTaskStatistics getSummaryStatistics(Integer stuId);

    List<StageTaskStatisticsDetail> getSummaryStatisticsDetail(Integer stuId);
}

package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gms.gms.dao.StageTaskStatisticsMapper;
import com.gms.gms.domain.StageTaskStatistics;
import com.gms.gms.domain.StageTaskStatisticsDetail;
import com.gms.gms.service.StageTaskStatisticsService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author MrBird
 */
@Service
public class StageTaskStatisticsServiceImpl extends ServiceImpl<StageTaskStatisticsMapper, StageTaskStatistics> implements StageTaskStatisticsService {


    @Override
    public StageTaskStatistics getSummaryStatistics(Integer stuId) {
        return this.baseMapper.getSummaryStatistics(stuId);
    }

    @Override
    public List<StageTaskStatisticsDetail> getSummaryStatisticsDetail(Integer stuId) {
        return this.baseMapper.getSummaryStatisticsDetail(stuId);
    }
}

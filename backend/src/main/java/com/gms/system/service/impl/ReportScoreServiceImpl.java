package com.gms.system.service.impl;

import com.gms.gms.domain.ReportScore;
import com.gms.gms.dao.ReportScoreMapper;
import com.gms.system.service.ReportScoreService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author MrBird
 */
@Service
public class ReportScoreServiceImpl extends ServiceImpl<ReportScoreMapper, ReportScore> implements ReportScoreService {

    @Override
    public void giveScore(ReportScore reportScore) {
        this.save(reportScore);
    }
}

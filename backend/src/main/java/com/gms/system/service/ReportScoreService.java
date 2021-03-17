package com.gms.system.service;

import com.gms.gms.domain.ReportScore;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author MrBird
 */
public interface ReportScoreService extends IService<ReportScore> {

    void giveScore(ReportScore reportScore);
}

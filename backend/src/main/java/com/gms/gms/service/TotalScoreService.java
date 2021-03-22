package com.gms.gms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.gms.gms.domain.SystemStage;
import com.gms.gms.domain.TotalScore;

import java.util.List;

/**
 * @author MrBird
 */
public interface TotalScoreService extends IService<TotalScore> {

    TotalScore getAllScore(Integer stuId);
}

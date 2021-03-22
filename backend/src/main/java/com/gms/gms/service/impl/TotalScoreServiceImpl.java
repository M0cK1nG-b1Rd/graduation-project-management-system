package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gms.gms.dao.PleaResultMapper;
import com.gms.gms.dao.TotalScoreMapper;
import com.gms.gms.domain.PleaResult;
import com.gms.gms.domain.TotalScore;
import com.gms.gms.service.PleaResultService;
import com.gms.gms.service.TotalScoreService;
import org.springframework.stereotype.Service;

/**
 * @author MrBird
 */
@Service
public class TotalScoreServiceImpl extends ServiceImpl<TotalScoreMapper, TotalScore> implements TotalScoreService {

    @Override
    public TotalScore getAllScore(Integer stuId) {
        return this.baseMapper.getAllScore(stuId);
    }
}

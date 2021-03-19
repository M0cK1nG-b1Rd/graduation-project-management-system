package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.gms.gms.domain.PleaResult;
import com.gms.gms.dao.PleaResultMapper;
import com.gms.gms.domain.Report;
import com.gms.gms.service.PleaResultService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author MrBird
 */
@Service
public class PleaResultServiceImpl extends ServiceImpl<PleaResultMapper, PleaResult> implements PleaResultService {

    @Override
    public Integer getStuId(Integer userId) {
        return this.baseMapper.getStuId(userId);
    }
    @Override
    public PleaResult getStartPleaResult(Integer stuId) {
        LambdaQueryWrapper<PleaResult> mapper = new LambdaQueryWrapper<>();
        mapper.eq(PleaResult::getStuId, stuId).eq(PleaResult::getStage,"KT");
        return this.baseMapper.selectOne(mapper);
    }

    @Override
    public PleaResult getMidPleaResult(Integer stuId) {
        LambdaQueryWrapper<PleaResult> mapper = new LambdaQueryWrapper<>();
        mapper.eq(PleaResult::getStuId, stuId).eq(PleaResult::getStage,"ZQ");
        return this.baseMapper.selectOne(mapper);
    }
}

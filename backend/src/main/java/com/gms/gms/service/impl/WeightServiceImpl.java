package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.gms.gms.domain.Weight;
import com.gms.gms.dao.WeightMapper;
import com.gms.gms.service.WeightService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author MrBird
 */
@Service
public class WeightServiceImpl extends ServiceImpl<WeightMapper, Weight> implements WeightService {

    @Override
    public Weight getWeight() {
        LambdaQueryWrapper<Weight> mapper=new LambdaQueryWrapper<>();
        return this.baseMapper.selectOne(mapper);
    }

    @Override
    public void putWeight(Weight weight) {
        LambdaQueryWrapper<Weight> mapper=new LambdaQueryWrapper<>();
        this.update(weight, mapper);
    }
}

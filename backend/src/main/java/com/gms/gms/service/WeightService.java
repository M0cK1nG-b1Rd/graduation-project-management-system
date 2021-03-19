package com.gms.gms.service;

import com.gms.gms.domain.Weight;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author MrBird
 */
public interface WeightService extends IService<Weight> {

    Weight getWeight();

    void putWeight(Weight weight);
}

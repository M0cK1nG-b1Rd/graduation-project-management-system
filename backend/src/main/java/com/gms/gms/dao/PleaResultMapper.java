package com.gms.gms.dao;

import com.gms.gms.domain.PleaResult;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * @author MrBird
 */
public interface PleaResultMapper extends BaseMapper<PleaResult> {

    Integer getStuId(Integer userId);
}

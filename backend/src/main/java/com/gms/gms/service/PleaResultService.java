package com.gms.gms.service;

import com.gms.gms.domain.PleaResult;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author MrBird
 */
public interface PleaResultService extends IService<PleaResult> {

    PleaResult getStartPleaResult(Integer stuId);

    PleaResult getMidPleaResult(Integer stuId);
}

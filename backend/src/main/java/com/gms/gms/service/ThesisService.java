package com.gms.gms.service;

import com.gms.gms.domain.Thesis;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author MrBird
 */
public interface ThesisService extends IService<Thesis> {

    Thesis getMyThesis(Integer stuId);
}

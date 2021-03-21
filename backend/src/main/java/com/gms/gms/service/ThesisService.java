package com.gms.gms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.Thesis;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author MrBird
 */
public interface ThesisService extends IService<Thesis> {

    Thesis getMyThesis(Integer stuId);

    Page<Thesis> getStuThesis(Thesis thesis, Integer teacherId);
}

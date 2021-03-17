package com.gms.gms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.Plea;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author MrBird
 */
public interface PleaService extends IService<Plea> {

    Page<Plea> getAllPlea(int page, int size, String stage);
}

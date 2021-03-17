package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.Plea;
import com.gms.gms.dao.PleaMapper;
import com.gms.gms.service.PleaService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author MrBird
 */
@Service
public class PleaServiceImpl extends ServiceImpl<PleaMapper, Plea> implements PleaService {

    @Override
    public Page<Plea> getAllPlea(int page, int size, String stage) {
        return this.baseMapper.getAllPlea(new Page<Plea>(page, size), stage);
    }
}

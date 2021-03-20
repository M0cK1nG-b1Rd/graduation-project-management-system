package com.gms.gms.service.impl;

import com.gms.gms.domain.Thesis;
import com.gms.gms.dao.ThesisMapper;
import com.gms.gms.service.ThesisService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author MrBird
 */
@Service
public class ThesisServiceImpl extends ServiceImpl<ThesisMapper, Thesis> implements ThesisService {

    @Override
    public Thesis getMyThesis(Integer stuId) {
        return this.baseMapper.getMyThesis(stuId);
    }
}

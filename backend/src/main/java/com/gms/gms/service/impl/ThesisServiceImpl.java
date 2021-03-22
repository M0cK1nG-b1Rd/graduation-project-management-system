package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
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

    @Override
    public Page<Thesis> getStuThesis(Thesis thesis, Integer teacherId) {
        Page<Thesis> thesisPage=new Page<>(thesis.getPage(),thesis.getSize());
        //TODO 可能的筛选预留地
        return this.baseMapper.getStuThesis(thesisPage,teacherId);
    }
}

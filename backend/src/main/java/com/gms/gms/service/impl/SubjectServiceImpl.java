package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.gms.gms.domain.Subject;
import com.gms.gms.dao.SubjectMapper;
import com.gms.gms.service.SubjectService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author MrBird
 */
@Service
public class SubjectServiceImpl extends ServiceImpl<SubjectMapper, Subject> implements SubjectService {

    @Override
    public List<Subject> getSubject() {
        return this.baseMapper.selectList(new LambdaQueryWrapper<>());
    }
}

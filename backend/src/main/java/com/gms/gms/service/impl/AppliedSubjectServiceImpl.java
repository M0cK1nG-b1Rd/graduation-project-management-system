package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.Announcement;
import com.gms.gms.domain.AppliedSubject;
import com.gms.gms.dao.AppliedSubjectMapper;
import com.gms.gms.domain.AppliedSubjectRecord;
import com.gms.gms.service.AppliedSubjectService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author MrBird
 */
@Service
public class AppliedSubjectServiceImpl extends ServiceImpl<AppliedSubjectMapper, AppliedSubject> implements AppliedSubjectService {

    @Override
    public void submitAppliance(AppliedSubject appliedSubject) {
        this.save(appliedSubject);
    }

    @Override
    public void auditAppliance(AppliedSubject appliedSubject) {
        this.updateById(appliedSubject);
    }

    @Override
    public IPage<AppliedSubject> selectWithCondition(AppliedSubject appliedSubject) {
        Page<AppliedSubject> appliedSubjectPage = new Page<>(appliedSubject.getPage(), appliedSubject.getSize());
        Page<AppliedSubject> returnSubjectPage = this.baseMapper.selectWithCondition(appliedSubjectPage);
        return null;
        //todo

    }
}

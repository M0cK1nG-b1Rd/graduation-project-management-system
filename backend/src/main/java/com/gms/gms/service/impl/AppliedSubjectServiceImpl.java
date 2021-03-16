package com.gms.gms.service.impl;

import com.gms.gms.domain.AppliedSubject;
import com.gms.gms.dao.AppliedSubjectMapper;
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


}

package com.gms.gms.dao;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.AppliedSubject;
import com.gms.gms.domain.Subject;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * @author MrBird
 */
public interface SubjectMapper extends BaseMapper<Subject> {

    void giveOpinion(String docId, Boolean isPassed, String feedback);

    Page<AppliedSubject> selectWithCondition(Page<AppliedSubject> page);
}

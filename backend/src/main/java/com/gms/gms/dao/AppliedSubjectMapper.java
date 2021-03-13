package com.gms.gms.dao;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.AppliedSubject;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.gms.gms.domain.AppliedSubjectRecord;

import java.util.List;

/**
 * @author MrBird
 */
public interface AppliedSubjectMapper extends BaseMapper<AppliedSubject> {

    Page<AppliedSubjectRecord> selectWithCondition(Page<AppliedSubject> appliedSubjectPage);
}

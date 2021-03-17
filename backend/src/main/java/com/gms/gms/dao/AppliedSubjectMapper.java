package com.gms.gms.dao;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.AppliedSubject;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * @author MrBird
 */
public interface AppliedSubjectMapper extends BaseMapper<AppliedSubject> {
    Page<AppliedSubject> selectWithCondition(Page<AppliedSubject> page, AppliedSubject appliedSubject);

    void auditAppliedSubject(@Param("appliedSubject") AppliedSubject appliedSubject);


    Page<AppliedSubject> selectWithConditionAsTeacher(Page<AppliedSubject> page, AppliedSubject appliedSubject, Integer teacherId);

    Page<AppliedSubject> selectWithConditionAsStudent(Page<AppliedSubject> page, AppliedSubject appliedSubject, Integer studentId);
}

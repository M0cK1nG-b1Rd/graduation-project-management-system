package com.gms.gms.dao;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.AppliedSubject;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.gms.gms.domain.Student;
import com.gms.gms.domain.Subject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author MrBird
 */
public interface AppliedSubjectMapper extends BaseMapper<AppliedSubject> {
    Page<AppliedSubject> selectWithCondition(Page<AppliedSubject> page, AppliedSubject appliedSubject);

    void auditAppliedSubject(@Param("appliedSubject") AppliedSubject appliedSubject);


    Page<AppliedSubject> selectWithConditionAsTeacher(Page<AppliedSubject> page, AppliedSubject appliedSubject, Integer teacherId);

    Page<AppliedSubject> selectWithConditionAsStudent(Page<AppliedSubject> page, AppliedSubject appliedSubject, Integer studentId);

    List<Student> getStudentsInSubject(String subId);

    List<Student> getStudentsOfTeacher(Integer teacherId);

    List<Student> getTotalStudentsInSubject(String subId);
}

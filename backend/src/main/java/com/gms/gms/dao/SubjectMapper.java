package com.gms.gms.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.Subject;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * @author MrBird
 */
public interface SubjectMapper extends BaseMapper<Subject> {

    void giveOpinion(String docId, String status, String feedback);

    Page<Subject> getPassedSubject(IPage<Subject> page, Subject subject);

    Page<Subject> getAllSubject(IPage<Subject> page, Subject subject);

    List<Subject> getMySubjectInfo(Integer teacherId);

    Subject getStudentPassedSubject(Integer stuId);
}

package com.gms.gms.dao;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.*;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * @author MrBird
 */
public interface ThesisTeacherMapper extends BaseMapper<ThesisTeacher> {

    List<Thesis> selectThesisIdAndTeacherId();

    Page<ThesisHelp> selectThesisGroupStage(Page<ThesisHelp> thesisTeacherPage);

    Teacher selectTeacherByTeacherId(Integer teacherId);

    Thesis getThesis(Integer teacherId);

    List<Thesis> selectThesisGroupStageTeacher(Integer teacherId);

    void inserts(List<ThesisTeacher> helpList);

    Subject getStudentPassedSubject(Integer stuId);
}

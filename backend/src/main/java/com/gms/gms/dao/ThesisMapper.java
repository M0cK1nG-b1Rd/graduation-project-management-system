package com.gms.gms.dao;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.FileStorage;
import com.gms.gms.domain.Student;
import com.gms.gms.domain.Thesis;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * @author MrBird
 */
public interface ThesisMapper extends BaseMapper<Thesis> {

    Thesis getMyThesis(Integer stuId);

    List<FileStorage> selectByDocId(String docId);

    Page<Thesis> getStuThesis(Page<Thesis> thesisPage, Integer teacherId);

    Student selectStudentById(Integer stuId);
}

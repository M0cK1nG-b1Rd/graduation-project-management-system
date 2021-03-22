package com.gms.gms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.Thesis;
import com.gms.gms.domain.ThesisHelp;
import com.gms.gms.domain.ThesisTeacher;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author MrBird
 */
public interface ThesisTeacherService extends IService<ThesisTeacher> {

    void groupTeacherAuto();

    Page<ThesisHelp> selectThesisGroupStage(Integer page, Integer size);

    List<Thesis> selectThesisGroupStageTeacher(Integer teacherId);
}

package com.gms.gms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.gms.gms.domain.*;
import com.gms.system.domain.User;

public interface AccountService extends IService<User>{
    Teacher getTeacherByUserId(Integer userId);

    Student getStudentByUserId(Integer userId);

    TeachingOffice getTeachingOfficeByUserId(Integer userId);

    Secretary getSecretaryByUserId(Integer userId);

    Page<Teacher> getAllTeacher(int page, int size);

    Page<Student> getAllStudent(int page, int size, String stage);

    void groupTeacherAuto(int teamSize, String stage);

    int selectStageInTeam(String stage, String tableName);

    Page<TeacherTeam> getTeacherTeam(int page, int size, String status);
}

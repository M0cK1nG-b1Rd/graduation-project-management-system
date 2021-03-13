package com.gms.gms.dao;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.gms.gms.domain.Secretary;
import com.gms.gms.domain.Student;
import com.gms.gms.domain.Teacher;
import com.gms.gms.domain.TeachingOffice;
import com.gms.system.domain.User;

public interface AccountMapper extends BaseMapper<User> {

    Teacher getTeacherByUserId(Integer userId);

    Student getStudentByUserId(Integer userId);

    TeachingOffice getTeachingOfficeByUserId(Integer userId);

    Secretary getSecretaryByUserId(Integer userId);
}

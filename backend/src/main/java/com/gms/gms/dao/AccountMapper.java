package com.gms.gms.dao;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.Secretary;
import com.gms.gms.domain.Student;
import com.gms.gms.domain.Teacher;
import com.gms.gms.domain.TeachingOffice;
import com.gms.system.domain.User;
import org.apache.ibatis.annotations.Param;

public interface AccountMapper extends BaseMapper<User> {

    Teacher getTeacherByUserId(Integer userId);

    Student getStudentByUserId(Integer userId);

    TeachingOffice getTeachingOfficeByUserId(Integer userId);

    Secretary getSecretaryByUserId(Integer userId);

    IPage<Teacher> selectAllTeacher(Page<Teacher> page);
}

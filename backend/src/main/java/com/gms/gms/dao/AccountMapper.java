package com.gms.gms.dao;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.*;
import com.gms.system.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AccountMapper extends BaseMapper<User> {

    Teacher getTeacherByUserId(Integer userId);

    Student getStudentByUserId(Integer userId);

    TeachingOffice getTeachingOfficeByUserId(Integer userId);

    Secretary getSecretaryByUserId(Integer userId);

    Page<Teacher> selectAllTeacher(Page<Teacher> page);

    Page<Student> selectAllStudent(Page<Student> studentPage, @Param("stage") String stage);

    List<Integer> selectAllTeacherId();

    List<Integer> selectAllSecretaryId();

    void addTeacherTeam(@Param("team")TeacherTeam teacherTeam);

    List<Integer> selectTeacherTeamId(@Param("stage") String stage);

    void addTeacherTeamMember(@Param("id") int integer, @Param("group")int maxGroup, boolean b);

    int selectStageInTeam(String stage, String tableName);

    Page<TeacherTeam> getTeacherTeam(Page<TeacherTeam> teacherTeamPage,@Param("status") String status);

    Secretary selectSecretaryById(int SecId,int teamId);

    List<AcceptanceTeacher> selectTeacherByTeamId(int id);

    Page<Student> selectAllStudent2(Page<Student> studentPage);

    List<Integer> getStudentNum(@Param("stage")String stage);
    //传参暂时没有使用，但便于以后修改不移除
    List<Integer> getStudentNum2(@Param("stage")String stage);

    void addStudentGroup(@Param("gro")StuGroup stuGroup);
}

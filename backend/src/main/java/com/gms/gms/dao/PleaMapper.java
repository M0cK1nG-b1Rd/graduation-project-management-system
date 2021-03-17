package com.gms.gms.dao;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.Plea;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.gms.gms.domain.StuGroup;
import com.gms.gms.domain.TeacherTeam;
import io.swagger.models.auth.In;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author MrBird
 */
public interface PleaMapper extends BaseMapper<Plea> {

    Page<Plea> getAllPlea(Page<Plea> pleaPage, @Param("stage") String stage);

    TeacherTeam selectTeacherTeam(Integer id);

    StuGroup getStudentGroup(@Param("id") Integer groupId,@Param("stage") String stage);

    Integer getStuId(@Param("userId") Integer userId);

    Integer getGroupId(@Param("stuId") Integer stuId, @Param("stage") String stage);

    List<Plea> getPleaForStudent(@Param("groupId") Integer groupId, @Param("stage") String stage);

    Integer getTeacherId(@Param("userId") Integer userId);

    Integer getTeamId(@Param("teacherId") Integer teacherId, @Param("stage") String stage);

    List<Plea> getPleaForOther(@Param("teamId") Integer teamId, @Param("stage") String stage);

    Integer getSecId(@Param("userId") Integer userId);

    Integer getTeamId1(@Param("secId") Integer secId,@Param("stage") String stage);
}

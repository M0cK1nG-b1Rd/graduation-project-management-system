package com.gms.gms.dao;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.Plea;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.gms.gms.domain.StuGroup;
import com.gms.gms.domain.TeacherTeam;
import io.swagger.models.auth.In;
import org.apache.ibatis.annotations.Param;

/**
 * @author MrBird
 */
public interface PleaMapper extends BaseMapper<Plea> {

    Page<Plea> getAllPlea(Page<Plea> pleaPage, @Param("stage") String stage);

    TeacherTeam selectTeacherTeam(Integer id);

    StuGroup getStudentGroup(@Param("id") Integer groupId,@Param("stage") String stage);
}

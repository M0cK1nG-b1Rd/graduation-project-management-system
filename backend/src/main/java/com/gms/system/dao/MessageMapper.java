package com.gms.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.Subject;
import com.gms.gms.domain.Thesis;
import com.gms.system.domain.Message;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author MrBird
 */
@Mapper
public interface MessageMapper extends BaseMapper<Message> {

    Page<Message> getMessage(Page<Message> messagePage,@Param("userId") int userId);

    List<Integer> getStudentUserId(String stage);

    List<Integer> getTeacherUserId(String stage);

    Integer getSecretaryUserId(String stage);

    Integer getUserIdByStuId(Integer id);

    List<Integer> getAllTeacherUserId();

    Integer countThesisGroupIsRelease();

    List<Integer> getTeacherUserIdThesis();

    Integer countScore(Integer id);

    void setScore(Integer thesisId);

    Thesis selectThesis(Integer id);

    Integer getUserIdBySubID(String subId);
}

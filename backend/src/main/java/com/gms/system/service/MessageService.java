package com.gms.system.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.gms.gms.domain.Report;
import com.gms.gms.domain.SystemStage;
import com.gms.gms.domain.Thesis;
import com.gms.system.domain.Message;

import java.util.List;

/**
 * @author MrBird
 */
public interface MessageService extends IService<Message> {

    Page<Message> getMessage(int page, int size, int userId);

    List<Integer> getStudentUserId(String stage);

    List<Integer> getTeacherUserId(String stage);

    List<Integer> getSecretaryUserId(String stage);

    Integer getUserIdByStuId(Integer studentId);

    List<Integer> getAllTeacherUserId();

    Integer countThesisGroupIsRelease();

    List<Integer> getTeacherUserIdThesis();

    Integer countScore(Integer id);

    void setScore(Integer thesisId);

    Thesis selectThesis(Integer id);

    Integer getUserIdBySubID(String subId);

    Report getMessageReport(Integer id);

    List<SystemStage> selectSystemStage(List<Integer> currStageIds);

    List<Integer> selectAllUserButAdmin();

    Integer getTaskStuUserId(Integer taskId);

    Integer getTaskTeaUserId(Integer taskId);

    Integer countPleaIsRelease(String stage);
}

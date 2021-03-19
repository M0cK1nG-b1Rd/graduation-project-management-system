package com.gms.gms.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gms.common.exception.GmsException;
import com.gms.gms.domain.Subject;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author MrBird
 */
public interface SubjectService extends IService<Subject> {

    List<Subject> getMySubject(String subId) throws GmsException;

    void deleteSubject(String subId);

    void giveOpinion(String docId, String status, String feedback);

    List<Subject> trackSubject(String subId);

    IPage<Subject> getPassedSubject(Subject subject);

    IPage<Subject> getAllSubject(Subject subject);

    Subject getStudentPassedSubject(Integer stuId);

}

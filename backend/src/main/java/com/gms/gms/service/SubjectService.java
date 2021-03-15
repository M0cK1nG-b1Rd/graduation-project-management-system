package com.gms.gms.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gms.gms.domain.AppliedSubject;
import com.gms.gms.domain.Subject;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author MrBird
 */
public interface SubjectService extends IService<Subject> {

    List<Subject> getSubject();

    void deleteSubject(String subId);

    void giveOpinion(String docId, Boolean isPassed, String feedback);

    List<Subject> trackSubject(String subId);

    IPage<AppliedSubject> selectWithCondition();
}

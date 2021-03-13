package com.gms.gms.dao;

import com.gms.gms.domain.Subject;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * @author MrBird
 */
public interface SubjectMapper extends BaseMapper<Subject> {

    void giveOpinion(String docId, Boolean isPassed, String feedback);
}

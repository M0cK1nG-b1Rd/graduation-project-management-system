package com.gms.gms.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.Subject;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * @author MrBird
 */
public interface SubjectMapper extends BaseMapper<Subject> {

    void giveOpinion(String docId, String status, String feedback);

    Page<Subject> selectWithCondition(IPage<Subject> page, Subject subject);
}

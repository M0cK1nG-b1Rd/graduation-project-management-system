package com.gms.gms.dao;

import com.gms.gms.domain.FileStorage;
import com.gms.gms.domain.Thesis;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * @author MrBird
 */
public interface ThesisMapper extends BaseMapper<Thesis> {

    Thesis getMyThesis(Integer stuId);

    List<FileStorage> selectByDocId(String docId);
}

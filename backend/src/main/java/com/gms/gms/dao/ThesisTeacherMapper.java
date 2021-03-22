package com.gms.gms.dao;

import com.gms.gms.domain.Thesis;
import com.gms.gms.domain.ThesisTeacher;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * @author MrBird
 */
public interface ThesisTeacherMapper extends BaseMapper<ThesisTeacher> {

    List<Thesis> selectThesisIdAndTeacherId();
}

package com.gms.gms.service;

import com.gms.gms.domain.ThesisTeacher;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author MrBird
 */
public interface ThesisTeacherService extends IService<ThesisTeacher> {

    void groupTeacherAuto();

}

package com.gms.gms.service;

import com.gms.gms.domain.Subject;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author MrBird
 */
public interface SubjectService extends IService<Subject> {

    List<Subject> getSubject();
}

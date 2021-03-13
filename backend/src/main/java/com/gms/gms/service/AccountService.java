package com.gms.gms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.gms.gms.domain.*;
import com.gms.system.domain.User;

public interface AccountService extends IService<User>{
    Teacher getTeacherByUserId(Integer userId);

    Student getStudentByUserId(Integer userId);

    TeachingOffice getTeachingOfficeByUserId(Integer userId);

    Secretary getSecretaryByUserId(Integer userId);

}

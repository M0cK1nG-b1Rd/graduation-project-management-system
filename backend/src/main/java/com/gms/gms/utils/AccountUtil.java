package com.gms.gms.utils;

import com.gms.common.exception.GmsException;
import com.gms.common.utils.GmsUtil;
import com.gms.common.utils.SpringContextUtil;
import com.gms.gms.domain.Secretary;
import com.gms.gms.domain.Student;
import com.gms.gms.domain.Teacher;
import com.gms.gms.domain.TeachingOffice;
import com.gms.gms.service.AccountService;
import com.gms.system.service.UserService;

public class AccountUtil {
    /*
     * 账号工具类，用于获得老师，教务，学生，秘书等具体角色个体的信息
     * */


    public static Teacher getCurrentTeacher() throws GmsException {
        Integer userId = GmsUtil.getCurrentUser().getUserId();
        AccountService accountService = SpringContextUtil.getBean(AccountService.class);
        Teacher teacher =accountService.getTeacherByUserId(userId);
        if (teacher==null) {
            throw new GmsException("该用户不是老师！");
        }
        return teacher;
    }

    public static Student getCurrentStudent() throws GmsException {
        Integer userId = GmsUtil.getCurrentUser().getUserId();
        AccountService accountService = SpringContextUtil.getBean(AccountService.class);
        Student student =accountService.getStudentByUserId(userId);
        if (student==null) {
            throw new GmsException("该用户不是学生！");
        }
        return student;
    }

    public static TeachingOffice getCurrentTeachingOffice() throws GmsException {
        Integer userId = GmsUtil.getCurrentUser().getUserId();
        AccountService accountService = SpringContextUtil.getBean(AccountService.class);
        TeachingOffice teachingOffice =accountService.getTeachingOfficeByUserId(userId);
        if (teachingOffice==null) {
            throw new GmsException("该用户不是教研办！");
        }
        return teachingOffice;
    }

    public static Secretary getCurrentSecretary() throws GmsException {
        Integer userId = GmsUtil.getCurrentUser().getUserId();
        AccountService accountService = SpringContextUtil.getBean(AccountService.class);
        Secretary secretary =accountService.getSecretaryByUserId(userId);
        if (secretary==null) {
            throw new GmsException("该用户不是答辩秘书！");
        }
        return secretary;
    }

}

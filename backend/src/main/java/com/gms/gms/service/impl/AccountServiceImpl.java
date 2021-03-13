package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gms.gms.dao.AccountMapper;
import com.gms.gms.domain.*;
import com.gms.gms.service.AccountService;
import com.gms.system.domain.User;
import org.springframework.stereotype.Service;

@Service
public class AccountServiceImpl extends ServiceImpl<AccountMapper, User> implements AccountService {

    @Override
    public Teacher getTeacherByUserId(Integer userId) {
        return this.baseMapper.getTeacherByUserId(userId);
    }

    @Override
    public Student getStudentByUserId(Integer userId) {
        return this.baseMapper.getStudentByUserId(userId);
    }

    @Override
    public TeachingOffice getTeachingOfficeByUserId(Integer userId) {
        return this.baseMapper.getTeachingOfficeByUserId(userId);
    }

    @Override
    public Secretary getSecretaryByUserId(Integer userId) {
        return this.baseMapper.getSecretaryByUserId(userId);
    }

    @Override
    public IPage<Teacher> getAllTeacher(int page, int size) {
        Page<Teacher> page1= new Page<>(page,size);
        return null;
    }
}

package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.code.Code;
import com.gms.gms.dao.AccountMapper;
import com.gms.gms.domain.*;
import com.gms.gms.service.AccountService;
import com.gms.system.domain.User;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

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
    public Page<Teacher> getAllTeacher(int page, int size) {
        Page<Teacher> page1= new Page<>(page,size);
        return this.baseMapper.selectAllTeacher(page1);
    }

    @Override
    public Page<Student> getAllStudent(int page, int size, String stage) {
        return this.baseMapper.selectAllStudent(new Page<Student>(page,size),stage);
    }

    @Override
    public void groupTeacherAuto(int teamSize, String stage) {
        List<Integer> teacherIds= this.baseMapper.selectAllTeacherId();
        List<Integer> secretaryIds= this.baseMapper.selectAllSecretaryId();
        Collections.shuffle(teacherIds);
        Collections.shuffle(secretaryIds);
        int maxGroup;
        TeacherTeam teacherTeam=new TeacherTeam();
        int j=0;
        for (int i=0;i<teacherIds.size();i+=teamSize,j=(j+1)%secretaryIds.size()){
            teacherTeam.setSecId(secretaryIds.get(j)).setStage(stage);
            this.baseMapper.addTeacherTeam(teacherTeam);
            maxGroup=this.baseMapper.selectMaxTeacherTeam();
            this.baseMapper.addTeacherTeamMember(teacherIds.get(i),maxGroup,true);
            for (int x=i+1;x<teamSize;x++){
                this.baseMapper.addTeacherTeamMember(teacherIds.get(x),maxGroup,false);
            }
        }
    }

    @Override
    public int selectStageInTeam(String stage, String tableName) {
        return this.baseMapper.selectStageInTeam(stage,tableName);
    }

    @Override
    public Page<TeacherTeam> getTeacherTeam(int page, int size, String status) {
        return this.baseMapper.getTeacherTeam(new Page<TeacherTeam>(page,size),status);
    }
}

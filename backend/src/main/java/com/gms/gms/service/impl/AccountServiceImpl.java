package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
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

import java.util.ArrayList;
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
        Page<Teacher> page1 = new Page<>(page, size);
        return this.baseMapper.selectAllTeacher(page1);
    }

    @Override
    public Page<Student> getAllStudent(int page, int size, String stage) {
        return this.baseMapper.selectAllStudent(new Page<Student>(page, size), stage);
    }

    @Override
    public Boolean groupTeacherAuto(int teamNum, String stage) {
        List<Integer> teacherIds = this.baseMapper.selectAllTeacherId();
        List<Integer> secretaryIds = this.baseMapper.selectAllSecretaryId();
        if (teamNum > teacherIds.size() || teamNum > secretaryIds.size()) {
            return false;
        }
        Collections.shuffle(teacherIds);
        Collections.shuffle(secretaryIds);
        List<TeacherTeam> teacherTeams = new ArrayList<>();
        List<Integer> groupId;
        for (int i = 0, j = 0; i < teamNum; i++, j++) {
            TeacherTeam teacherTeam = new TeacherTeam().setSecId(secretaryIds.get(j)).setStage(stage);
            teacherTeams.add(teacherTeam);
        }
        this.baseMapper.addTeacherTeam(teacherTeams);
        groupId = this.baseMapper.selectTeacherTeamId(stage);
        List<TeacherTeamHelp> teamHelps = new ArrayList<>();
        for (int i = 0; i < teamNum; i++) {
            TeacherTeamHelp help = new TeacherTeamHelp().setTeacherId(teacherIds.get(i)).setTeamId(groupId.get(i)).setLeader(true);
            teamHelps.add(help);
        }
        for (int i = teamNum; i < teacherIds.size(); i++) {
            TeacherTeamHelp help = new TeacherTeamHelp().setTeacherId(teacherIds.get(i)).setTeamId(groupId.get(i % teamNum)).setLeader(false);
            teamHelps.add(help);
        }
        this.baseMapper.addTeacherTeamMember(teamHelps);
        return true;
    }

    @Override
    public int selectStageInTeam(String stage, String tableName) {
        return this.baseMapper.selectStageInTeam(stage, tableName);
    }

    @Override
    public Page<TeacherTeam> getTeacherTeam(int page, int size, String status) {
        return this.baseMapper.getTeacherTeam(new Page<TeacherTeam>(page, size), status);
    }

    @Override
    public Page<Student> getAllStudent2(int page, int size) {
        return this.baseMapper.selectAllStudent2(new Page<Student>(page, size));
    }

    @Override
    public boolean groupStudentAuto(Integer teamNum, String stage) {
        List<Integer> studentIds;
        if ("JT".equals(stage)) {
            studentIds = this.baseMapper.getStudentNum(stage);
        } else if ("KT".equals(stage) || "ZQ".equals(stage)) {
            studentIds = this.baseMapper.getStudentNum2(stage);
        } else {
            return false;
        }
        Collections.shuffle(studentIds);
        List<StuGroup> stuGroups = new ArrayList<>();
        Integer groupId = this.baseMapper.selectMaxId();
        if(groupId==null){groupId=0;}
        for (int i=0,j=groupId;i<studentIds.size();i++,j=((j-groupId+1)%teamNum)+groupId){
            StuGroup stuGroup = new StuGroup().setGroupId(j).setStuId(studentIds.get(i)).setStage(stage);
            stuGroups.add(stuGroup);
        }
        this.baseMapper.addStudentGroup(stuGroups);
        return true;
    }

    @Override
    public Page<StuGroup> getStudentGroup(int page, int size, String stage) {
        return this.baseMapper.getStudentGroup(new Page<StuGroup>(page, size), stage);
    }

    @Override
    public void deleteGroups(String stage) {
        this.baseMapper.deleteStudent(stage);
        List<Integer> groupId=this.baseMapper.selectTeacherTeamId(stage);
        if(groupId.size()>0){
            this.baseMapper.deleteTeacherInTeam(groupId);
        }
        this.baseMapper.deleteTeacherTeam(stage);

    }

    @Override
    public List<Integer> getAllStudentIds() {
return this.baseMapper.getAllStudentIds();
    }
}

package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.common.exception.GmsException;
import com.gms.gms.domain.Subject;
import com.gms.gms.dao.SubjectMapper;
import com.gms.gms.service.SubjectService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gms.gms.utils.AccountUtil;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author MrBird
 */
@Service
public class SubjectServiceImpl extends ServiceImpl<SubjectMapper, Subject> implements SubjectService {

    @Override
    public List<Subject> getMySubject(String subId) throws GmsException {
        Integer teacherId = AccountUtil.getCurrentTeacher().getTeacherId();
        return this.baseMapper.getMySubjectInfo(teacherId,subId);
    }

    @Override
    public void deleteSubject(String subId) {
        this.baseMapper.deleteById(subId);
    }

    @Override
    public void giveOpinion(Subject opinion) {
        LambdaQueryWrapper<Subject> mapper = new LambdaQueryWrapper<>();
        mapper.eq(Subject::getSubId, opinion.getSubId());
        this.baseMapper.update(opinion, mapper);

    }

    @Override
    public  List<Subject> trackSubject(String subId) {
        LambdaQueryWrapper<Subject> map=new LambdaQueryWrapper<>();
        map.eq(Subject::getSubId, subId);
        return this.baseMapper.selectList(map);
    }

    @Override
    public IPage<Subject> getPassedSubject(Subject subject) {
        Page<Subject> page = new Page<>(subject.getPage(),  subject.getSize());
        Page<Subject> returnSubjectPage = this.baseMapper.getPassedSubject(page,subject);
        return returnSubjectPage;
    }

    @Override
    public IPage<Subject> getAllSubject(Subject subject) {
        Page<Subject> page = new Page<>(subject.getPage(),  subject.getSize());
        return this.baseMapper.getAllSubject(page,subject);
    }

    @Override
    public Subject getStudentPassedSubject(Integer stuId) {
        return this.baseMapper.getStudentPassedSubject(stuId);
    }

    @Override
    public Subject getBySubId(String subId) {
        LambdaQueryWrapper<Subject> map=new LambdaQueryWrapper<>();
        map.eq(Subject::getSubId, subId);
        return this.baseMapper.selectOne(map);
    }

    @Override
    public void updateChosen(Subject subject) {
        this.updateById(subject);
    }

}

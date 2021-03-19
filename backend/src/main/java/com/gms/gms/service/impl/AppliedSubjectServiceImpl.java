package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.common.exception.GmsException;
import com.gms.gms.domain.AppliedSubject;
import com.gms.gms.dao.AppliedSubjectMapper;
import com.gms.gms.domain.Student;
import com.gms.gms.domain.Subject;
import com.gms.gms.service.AppliedSubjectService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gms.gms.utils.AccountUtil;
import io.swagger.models.auth.In;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author MrBird
 */
@Service
public class AppliedSubjectServiceImpl extends ServiceImpl<AppliedSubjectMapper, AppliedSubject> implements AppliedSubjectService {

    @Override
    public void submitAppliance(AppliedSubject appliedSubject) {
        this.save(appliedSubject);
    }

    @Override
    public void auditAppliance(AppliedSubject appliedSubject) {
        this.updateById(appliedSubject);
    }

    @Override
    public IPage<AppliedSubject> selectWithCondition(AppliedSubject appliedSubject, String roleName) throws GmsException {
        Page<AppliedSubject> page = new Page<>(appliedSubject.getPage(),  appliedSubject.getSize());
        Page<AppliedSubject> appliedSubjectPage;

        //区分不同角色并调用不同的方法
        if(roleName.equals("管理员") || roleName.equals("系办")){
            appliedSubjectPage = this.baseMapper.selectWithCondition(page,appliedSubject);
        }else if(roleName.equals("老师")){
            Integer teacherId = AccountUtil.getCurrentTeacher().getTeacherId();
            appliedSubjectPage = this.baseMapper.selectWithConditionAsTeacher(page,appliedSubject,teacherId);

        }else {
            //学生
            Integer studentId = AccountUtil.getCurrentStudent().getStuId();
            appliedSubjectPage = this.baseMapper.selectWithConditionAsStudent(page,appliedSubject,studentId);
        }

        return appliedSubjectPage;
    }

    @Override
    public void addAppliedSubject(AppliedSubject appliedSubject) {
        this.save(appliedSubject);
    }

    @Override
    public void auditAppliedSubject(AppliedSubject appliedSubject) {
        this.baseMapper.auditAppliedSubject(appliedSubject);
    }

    @Override
    public List<Student> getStudentsInSubject(String subId) {
        return this.baseMapper.getStudentsInSubject(subId);
    }


}

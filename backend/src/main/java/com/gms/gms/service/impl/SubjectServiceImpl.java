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

    //todo 对接
    @Override
    public List<Subject> getMySubject() throws GmsException {
        Integer teacherId = AccountUtil.getCurrentTeacher().getTeacherId();
        LambdaQueryWrapper<Subject> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Subject::getPoseBy, teacherId);
        return this.baseMapper.selectList(wrapper);
    }

    @Override
    public void deleteSubject(String subId) {
        this.baseMapper.deleteById(subId);
    }

    @Override
    public void giveOpinion(String docId, String status, String feedback) {
        this.baseMapper.giveOpinion(docId,status,feedback);
    }

    @Override
    public  List<Subject> trackSubject(String subId) {
        LambdaQueryWrapper<Subject> map=new LambdaQueryWrapper<>();
        map.eq(Subject::getSubId, subId);
        return this.baseMapper.selectList(map);
    }

    @Override
    public IPage<Subject> selectWithCondition(Subject subject) {
        Page<Subject> page = new Page<>(subject.getCurrent(),  subject.getSize());//todo 增加分页
        Page<Subject> returnSubjectPage = this.baseMapper.selectWithCondition(page,subject);
        return returnSubjectPage;
    }
}

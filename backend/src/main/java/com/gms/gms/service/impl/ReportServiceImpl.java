package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.common.exception.GmsException;
import com.gms.gms.domain.AppliedSubject;
import com.gms.gms.domain.Report;
import com.gms.gms.dao.ReportMapper;
import com.gms.gms.domain.StageTaskResult;
import com.gms.gms.service.ReportService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gms.gms.utils.AccountUtil;
import org.springframework.stereotype.Service;

/**
 * @author MrBird
 */
@Service
public class ReportServiceImpl extends ServiceImpl<ReportMapper, Report> implements ReportService {

    @Override
    public IPage<Report> selectReport(Report report, String roleName) throws GmsException {
        Integer inPage = report.getPage();
        Integer inSize = report.getSize();
        Page<Report> page = new Page<>(inPage==null?1:inPage,inSize==null?Integer.MAX_VALUE:inSize);
        Page<Report> appliedSubjectPage;

        //区分不同角色并调用不同的方法
        if(roleName.equals("管理员") || roleName.equals("系办")){
            appliedSubjectPage = this.baseMapper.selectReport(page,report);
        }else if(roleName.equals("老师")){
            Integer teacherId = AccountUtil.getCurrentTeacher().getTeacherId();
            appliedSubjectPage = this.baseMapper.selectReportAsTeacher(page,report,teacherId);

        }else {
            //学生
            Integer studentId = AccountUtil.getCurrentStudent().getStuId();
            appliedSubjectPage = this.baseMapper.selectReportAsStudent(page,report,studentId);
        }

        return appliedSubjectPage;
    }

    @Override
    public void addReport(Report report) {
        this.save(report);
    }

    @Override
    public void auditReport(Report report) {
        this.updateById(report);
    }

    @Override
    public Report getStartReport(Integer stuId) {
        LambdaQueryWrapper<Report> mapper = new LambdaQueryWrapper<>();
        mapper.eq(Report::getPoseBy, stuId).eq(Report::getStage,"KT");
        return this.baseMapper.selectOne(mapper);
    }

    @Override
    public Report getMidReport(Integer stuId) {
        LambdaQueryWrapper<Report> mapper = new LambdaQueryWrapper<>();
        mapper.eq(Report::getPoseBy, stuId).eq(Report::getStage,"ZQ");
        return this.baseMapper.selectOne(mapper);
    }

}

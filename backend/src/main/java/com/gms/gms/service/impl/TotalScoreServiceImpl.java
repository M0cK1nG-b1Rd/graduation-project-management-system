package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gms.gms.dao.TotalScoreMapper;
import com.gms.gms.domain.Teacher;
import com.gms.gms.domain.TotalScore;
import com.gms.gms.domain.TotalScoreStatistics;
import com.gms.gms.service.TotalScoreService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author MrBird
 */
@Service
public class TotalScoreServiceImpl extends ServiceImpl<TotalScoreMapper, TotalScore> implements TotalScoreService {

    @Override
    public TotalScore getAllScoreAsStudent(Integer stuId) {
        return this.baseMapper.getAllScoreAsStudent(stuId);
    }

    @Override
    public Page<TotalScore> getAllScoreAsTeacher(Integer page, Integer size, List<Integer> stuIds) {
        Page<Teacher> teacherPage = new Page<>(page, size);
        return this.baseMapper.getAllScoreAsTeacher(teacherPage, stuIds);
    }

    @Override
    public Integer getStartGreaterThan(Integer currStuId, List<Integer> stuIds) {
        return this.baseMapper.getStartGreaterThan(currStuId, stuIds);
    }

    @Override
    public Integer getMidGreaterThan(Integer currStuId, List<Integer> stuIds) {
        return this.baseMapper.getMidGreaterThan(currStuId, stuIds);
    }

    @Override
    public Integer getFinGreaterThan(Integer currStuId, List<Integer> stuIds) {
        return this.baseMapper.getFinGreaterThan(currStuId, stuIds);
    }

    @Override
    public Integer getStageTaskGreaterThan(Integer currStuId, List<Integer> stuIds) {
        return this.baseMapper.getStageTaskGreaterThan(currStuId, stuIds);
    }

    @Override
    public Integer getTotalGreaterThan(Integer currStuId, List<Integer> stuIds) {
        return this.baseMapper.getTotalGreaterThan(currStuId, stuIds);
    }

    @Override
    public Integer getStartPublished(List<Integer> stuIds) {
        return this.baseMapper.getStartPublished(stuIds);
    }

    @Override
    public Integer getMidPublished(List<Integer> stuIds) {
        return this.baseMapper.getMidPublished(stuIds);
    }

    @Override
    public Integer getFinPublished(List<Integer> stuIds) {
        return this.baseMapper.getFinPublished(stuIds);
    }

    @Override
    public Integer getStageTaskPublished(List<Integer> stuIds) {
        return this.baseMapper.getStageTaskPublished(stuIds);
    }

    @Override
    public Integer getTotalPublished(List<Integer> stuIds) {
        return this.baseMapper.getTotalPublished(stuIds);
    }

    @Override
    public TotalScoreStatistics getStatistics(Integer stuId, List<Integer> stuIds) {

        Double startPublished =  (double)getStartPublished(stuIds);
        Double midPublished = (double)getMidPublished(stuIds);
        Double finPublished =  (double)getFinPublished(stuIds);
        Double stageTaskPublished =(double)getStageTaskPublished(stuIds);
        Double totalPublished = (double)getTotalPublished(stuIds);


        Double startGreaterThan =  getStartGreaterThan(stuId,stuIds) /(startPublished == 0.0D? 1.0D:startPublished);
        Double midGreaterThan =  getMidGreaterThan(stuId,stuIds) /(midPublished == 0.0D? 1.0D:midPublished);
        Double finGreaterThan =  getFinGreaterThan(stuId,stuIds) /(finPublished == 0.0D? 1.0D:finPublished);
        Double stageTaskGreaterThan =  getStageTaskGreaterThan(stuId,stuIds) / (stageTaskPublished == 0.0D? 1.0D:stageTaskPublished);
        Double totalGreaterThan =  getTotalGreaterThan(stuId,stuIds) / (totalPublished == 0.0D? 1.0D:totalPublished);
        return new TotalScoreStatistics(startGreaterThan,midGreaterThan,finGreaterThan,stageTaskGreaterThan,totalGreaterThan);
    }


}

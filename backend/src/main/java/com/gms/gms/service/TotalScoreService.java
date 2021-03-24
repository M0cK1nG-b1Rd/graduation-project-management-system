package com.gms.gms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.gms.gms.domain.TotalScore;
import com.gms.gms.domain.TotalScoreStatistics;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author MrBird
 */
public interface TotalScoreService extends IService<TotalScore> {

    TotalScore getAllScoreAsStudent(Integer stuId);

    Page<TotalScore> getAllScoreAsTeacher(Integer page, Integer size, List<Integer> stuIds);

    Integer getStartGreaterThan(Integer currStuId, List<Integer> stuIds);

    Integer getMidGreaterThan(Integer currStuId, List<Integer> stuIds);

    Integer getFinGreaterThan(Integer currStuId, List<Integer> stuIds);

    Integer getStageTaskGreaterThan(Integer currStuId, List<Integer> stuIds);

    Integer getTotalGreaterThan(Integer currStuId, List<Integer> stuIds);

    Integer getStartPublished(List<Integer> stuIds);

    Integer getMidPublished(List<Integer> stuIds);

    Integer getFinPublished(List<Integer> stuIds);

    Integer getStageTaskPublished(List<Integer> stuIds);

    Integer getTotalPublished(List<Integer> stuIds);

    TotalScoreStatistics getStatistics(Integer stuId, List<Integer> stuIds);
}

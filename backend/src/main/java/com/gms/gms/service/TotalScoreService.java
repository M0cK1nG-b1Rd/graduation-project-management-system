package com.gms.gms.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.gms.gms.domain.SystemStage;
import com.gms.gms.domain.TotalScore;
import com.gms.gms.domain.TotalScoreStatistics;
import io.swagger.models.auth.In;

import java.util.List;

/**
 * @author MrBird
 */
public interface TotalScoreService extends IService<TotalScore> {

    TotalScore getAllScoreAsStudent(Integer stuId);

    Page<TotalScore> getAllScoreAsTeacher(Integer page, Integer size, List<Integer> stuIds);

    TotalScoreStatistics getScoreStatistics(Integer stuId, List<Integer> stuIds);
}

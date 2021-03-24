package com.gms.gms.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.StageTaskResult;
import com.gms.gms.domain.Teacher;
import com.gms.gms.domain.TotalScore;
import com.gms.gms.domain.TotalScoreStatistics;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author MrBird
 */
public interface TotalScoreMapper extends BaseMapper<TotalScore> {

    TotalScore getAllScoreAsStudent(Integer stuId);

    Page<TotalScore> getAllScoreAsTeacher(Page<Teacher> teacherPage, @Param("stuIds") List<Integer> stuIds);

    TotalScoreStatistics getScoreStatistics(Integer currStuId,@Param("stuIds") List<Integer> stuIds);
}

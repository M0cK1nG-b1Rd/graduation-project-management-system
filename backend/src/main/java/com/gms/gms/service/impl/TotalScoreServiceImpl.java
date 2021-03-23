package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gms.gms.dao.TotalScoreMapper;
import com.gms.gms.domain.Teacher;
import com.gms.gms.domain.TotalScore;
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
        return this.baseMapper.getAllScoreAsTeacher(teacherPage,stuIds);
    }
}

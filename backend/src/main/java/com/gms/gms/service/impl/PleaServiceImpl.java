package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.Plea;
import com.gms.gms.dao.PleaMapper;
import com.gms.gms.service.PleaService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author MrBird
 */
@Service
public class PleaServiceImpl extends ServiceImpl<PleaMapper, Plea> implements PleaService {

    @Override
    public Page<Plea> getAllPlea(int page, int size, String stage) {
        return this.baseMapper.getAllPlea(new Page<Plea>(page, size), stage);
    }

    @Override
    public Integer getStuId(Integer userId) {
        return this.baseMapper.getStuId(userId);
    }

    @Override
    public Integer getGroupId(Integer stuId, String stage) {
        return this.baseMapper.getGroupId(stuId, stage);
    }

    @Override
    public List<Plea> getPleaForStudent(Integer groupId, String stage) {
        return this.baseMapper.getPleaForStudent(groupId, stage);
    }

    @Override
    public Integer getTeacherId(Integer userId) {
        return this.baseMapper.getTeacherId(userId);
    }

    @Override
    public Integer getTeamId(Integer teacherId, String stage) {
        return this.baseMapper.getTeamId(teacherId, stage);
    }

    @Override
    public List<Plea> getPleaForOther(Integer teamId, String stage) {
        return this.baseMapper.getPleaForOther(teamId, stage);
    }

    @Override
    public Integer getSecId(Integer userId) {
        return this.baseMapper.getSecId(userId);
    }

    @Override
    public Integer getTeamId1(Integer secId, String stage) {
        return this.baseMapper.getTeamId1(secId, stage);
    }
}

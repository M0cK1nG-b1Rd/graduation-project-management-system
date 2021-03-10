package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.gms.common.domain.GmsResponse;
import com.gms.gms.domain.SystemStage;
import com.gms.gms.dao.SystemStageMapper;
import com.gms.gms.service.SystemStageService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gms.system.domain.Menu;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author MrBird
 */
@Service
public class SystemStageServiceImpl extends ServiceImpl<SystemStageMapper, SystemStage> implements SystemStageService {

    @Override
    public List<SystemStage> getAllSystemStage() {
        return this.baseMapper.selectList(new LambdaQueryWrapper<>());
    }
    @Override
    public List<SystemStage> getCurrSystemStage() {
        LambdaQueryWrapper<SystemStage> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(SystemStage::getIsCurrent,1);
        return this.baseMapper.selectList(queryWrapper);
    }
    @Override
    public Integer getSystemStageNum() {
        return this.baseMapper.getSystemStageNum();
    }

    @Override
    public void setCurrStage(SystemStage currStage) {
        this.baseMapper.updateById(currStage);
    }
    public void enableStages(List<Integer> currStageIds) {
        this.baseMapper.disableAllStage();
        this.baseMapper.enableStages(currStageIds);
    }
}

package com.gms.gms.dao;

import com.gms.gms.domain.SystemStage;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * @author MrBird
 */
public interface SystemStageMapper extends BaseMapper<SystemStage> {

    SystemStage getCurrSystemStage();

    Integer getSystemStageNum();

    void setCurrStage(List<Integer> currStageIds);
}

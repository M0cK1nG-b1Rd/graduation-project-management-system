package com.gms.gms.service;

import com.gms.common.domain.GmsResponse;
import com.gms.gms.domain.SystemStage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author MrBird
 */
public interface SystemStageService extends IService<SystemStage> {
    List<SystemStage> getAllSystemStage();

    List<SystemStage> getCurrSystemStage();

     Integer getSystemStageNum();

    void setCurrStage(List<Integer> currStageIds);
}

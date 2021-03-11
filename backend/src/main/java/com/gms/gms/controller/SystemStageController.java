package com.gms.gms.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.gms.domain.SystemStage;
import com.gms.gms.service.SystemStageService;
import com.gms.system.domain.Menu;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author MrBird
 */
@Slf4j
@Validated
@RestController
@RequestMapping("stage/system")
public class SystemStageController {

    @Autowired
    SystemStageService systemStageService;


    @GetMapping
    public GmsResponse getSystemStage() throws GmsException {
        try {
            List<SystemStage> systemStage = systemStageService.getAllSystemStage();
            Set<Integer> currStageIds = systemStageService.getCurrSystemStage().stream().map(SystemStage::getStageId).collect(Collectors.toSet());
            Integer totalStageNum = systemStageService.getSystemStageNum();
            LinkedHashMap<String, Object> map = new LinkedHashMap<>();
            map.put("allStage", systemStage);
            map.put("currentStageId", currStageIds);
            map.put("totalStageNum", totalStageNum);
            return new GmsResponse().addCodeMessage(new Meta(Code.C200.getCode(), Code.C200.getDesc(), "查询成功"), map);
        } catch (Exception e) {
            String message = "新建失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    @PutMapping
    public void updateSystemStage(@RequestBody SystemStage currStage) throws GmsException {
        try {
            systemStageService.setCurrStage(currStage);
        } catch (Exception e) {
            String message = "新建失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    @PutMapping("activate")
    public void updateSystemStage(@RequestBody List<Integer> currStageIds) throws GmsException {
        try {
            systemStageService.enableStages(currStageIds);
        } catch (Exception e) {
            String message = "新建失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }
}

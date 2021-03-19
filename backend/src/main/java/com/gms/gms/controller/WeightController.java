package com.gms.gms.controller;


import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.gms.domain.SystemStage;
import com.gms.gms.domain.Weight;
import com.gms.gms.service.WeightService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("score/weight")
public class WeightController {

    @Autowired
    WeightService weightService;

    @GetMapping
    public GmsResponse getWeight() throws GmsException {
        try {
            Weight weight = weightService.getWeight();
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"),weight
            );
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    @PutMapping
    public GmsResponse putWeight(@RequestBody  Weight weight) throws GmsException {
        try {
            weightService.putWeight(weight);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "更新分数权重成功")
            );
        } catch (Exception e) {
            String message = "更新分数权重失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }
}



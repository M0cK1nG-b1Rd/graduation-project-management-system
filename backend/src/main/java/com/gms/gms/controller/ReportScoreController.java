package com.gms.gms.controller;


import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.gms.domain.ReportScore;
import com.gms.system.service.ReportScoreService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * @author MrBird
 */
@Slf4j
@Validated
@RestController
@RequestMapping("report/score")
public class ReportScoreController {

    @Autowired
    ReportScoreService reportScoreService;

    // TODO: 2021/3/17  修改
    @GetMapping
    public GmsResponse getScore(ReportScore reportScore) throws GmsException {
        try {
            reportScoreService.giveScore(reportScore);

            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "获取分数成功"));
        } catch (Exception e) {
            String message = "获取分数失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    @PostMapping
    public GmsResponse giveScore(@RequestBody ReportScore reportScore) throws GmsException {
        try {
            reportScoreService.giveScore(reportScore);

            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "打分成功"));
        } catch (Exception e) {
            String message = "打分失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

}

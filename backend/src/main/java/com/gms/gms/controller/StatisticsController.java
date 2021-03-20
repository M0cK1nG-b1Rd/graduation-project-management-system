package com.gms.gms.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.common.utils.GmsUtil;
import com.gms.gms.domain.AppliedSubject;
import com.gms.gms.domain.PleaResult;
import com.gms.gms.domain.Report;
import com.gms.gms.service.PleaResultService;
import com.gms.gms.service.ReportService;
import com.gms.gms.utils.AccountUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.xml.ws.Action;
import java.util.Date;
import java.util.LinkedHashMap;

/**
 * @author MrBird
 */
@Slf4j
@Validated
@RestController
@RequestMapping("statistics")
public class StatisticsController {

    @Autowired
    ReportService reportService;
    @Autowired
    PleaResultService pleaResultService;

    @GetMapping("score/star" +
            "" +
            "" +
            "t")
    public GmsResponse getStartScore() throws GmsException {
        try {
            Integer stuId = AccountUtil.getCurrentStudent().getStuId();
            Report applyList = reportService.getStartReport(stuId);
            PleaResult result = pleaResultService.getStartPleaResult(stuId);
            Integer fileScore = applyList.getScore();
            String fileFeedback=applyList.getComment();
            Integer defenseScore = result.getScore();
            String defenseFeedback = result.getFeedback();
            LinkedHashMap<String, Object> map = new LinkedHashMap<>();
            map.put("fileScore",fileScore);
            map.put("fileFeedback",fileFeedback);
            map.put("defenseScore",defenseScore);
            map.put("defenseFeedback",defenseFeedback);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"),map);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    @GetMapping("score/mid")
    public GmsResponse getReportScore() throws GmsException {
        try {
            Integer stuId = AccountUtil.getCurrentStudent().getStuId();

            Report applyList = reportService.getMidReport(stuId);
            PleaResult result = pleaResultService.getMidPleaResult(stuId);
            Integer fileScore = applyList.getScore();
            String fileFeedback=applyList.getComment();
            Integer defenseScore = result.getScore();
            String defenseFeedback = result.getFeedback();
            LinkedHashMap<String, Object> map = new LinkedHashMap<>();
            map.put("fileScore",fileScore);
            map.put("fileFeedback",fileFeedback);
            map.put("defenseScore",defenseScore);
            map.put("defenseFeedback",defenseFeedback);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"),map);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }


}

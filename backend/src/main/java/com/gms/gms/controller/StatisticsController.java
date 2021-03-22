package com.gms.gms.controller;


import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.gms.domain.*;
import com.gms.gms.service.*;
import com.gms.gms.utils.AccountUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedHashMap;
import java.util.List;

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
    @Autowired
    StageTaskResultService stageTaskResultService;
    @Autowired
    StageTaskService stageTaskService;
    @Autowired
    StageTaskStatisticsService stageTaskStatisticsService;
    @Autowired
    TotalScoreService totalScoreService;


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
        }catch (GmsException e) {
            String message = "查询失败";
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C500.getCode(),
                    Code.C500.getDesc(),
                    message + " : " + e));
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
        } catch (GmsException e) {
            String message = "查询失败";
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C500.getCode(),
                    Code.C500.getDesc(),
                    message + " : " + e));
        }catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }


        @GetMapping("stageTask")
    public GmsResponse getStageTaskResultStatistics() throws GmsException {
        try {
            Integer stuId = AccountUtil.getCurrentStudent().getStuId();
            StageTaskStatistics statistics = stageTaskStatisticsService.getSummaryStatistics(stuId);
            List<StageTaskStatisticsDetail> statistics_detail = stageTaskStatisticsService.getSummaryStatisticsDetail(stuId);
            statistics.setDetailList(statistics_detail);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"),statistics);
        } catch (GmsException e) {
            String message = "查询失败";
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C500.getCode(),
                    Code.C500.getDesc(),
                    message + " : " + e));
        }catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }


    @GetMapping("allScore")
    public GmsResponse getAllScore() throws GmsException {
        try {
            Integer stuId = AccountUtil.getCurrentStudent().getStuId();
            TotalScore score = totalScoreService.getAllScore(stuId);


            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"),score);
        } catch (GmsException e) {
            String message = "查询失败";
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C500.getCode(),
                    Code.C500.getDesc(),
                    message + " : " + e));
        }catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

}

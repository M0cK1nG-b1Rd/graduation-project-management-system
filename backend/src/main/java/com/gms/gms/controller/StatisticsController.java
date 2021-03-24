package com.gms.gms.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
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
import java.util.stream.Collectors;

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
    @Autowired
    AppliedSubjectService appliedSubjectService;
    @Autowired
    WeightService weightService;
    @Autowired
    ThesisService thesisService;


    @GetMapping("score/start")
    public GmsResponse getStartScore() throws GmsException {
        try {
            Weight weight = weightService.getWeight();
            Integer stuId = AccountUtil.getCurrentStudent().getStuId();

            Report applyList = reportService.getStartReport(stuId);
            Integer fileScore;
            String fileFeedback;
            if (applyList == null) {
                //前端要求，用于判断渲染
                fileScore = -1;
                fileFeedback = "暂无反馈！";
            } else {
                fileScore = applyList.getScore();
                fileFeedback = applyList.getComment();
            }


            PleaResult result = pleaResultService.getStartPleaResult(stuId);
            Integer defenseScore;
            String defenseFeedback;

            if (result == null) {
                //前端要求，用于判断渲染
                defenseScore = -1;
                defenseFeedback = "暂无反馈！";
            } else {
                defenseScore = result.getScore();
                defenseFeedback = result.getFeedback();
            }

            Double startScore;
            if (fileScore == -1 || defenseScore == -1) {
                startScore = -1D;
            } else {
                startScore = (weight.getStartMaterial() * fileScore + weight.getStartPlea() * defenseScore) / 100;
            }


            LinkedHashMap<String, Object> map = new LinkedHashMap<>();

            map.put("fileScore", fileScore);
            map.put("fileFeedback", fileFeedback);
            map.put("defenseScore", defenseScore);
            map.put("defenseFeedback", defenseFeedback);
            map.put("startScore", startScore);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"), map);

        } catch (GmsException e) {
            String message = "查询失败";
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C500.getCode(),
                    Code.C500.getDesc(),
                    message + " : " + e.getMessage()));
        } catch (NullPointerException e) {
            String message = "暂未出分";
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C500.getCode(),
                    Code.C500.getDesc(),
                    message));
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    @GetMapping("score/mid")
    public GmsResponse getMiddleScore() throws GmsException {
        try {
            Weight weight = weightService.getWeight();
            Integer stuId = AccountUtil.getCurrentStudent().getStuId();

            Report applyList = reportService.getMidReport(stuId);

            Integer fileScore;
            String fileFeedback;
            if (applyList == null) {
                //前端要求，用于判断渲染
                fileScore = -1;
                fileFeedback = "暂无反馈！";
            } else {
                fileScore = applyList.getScore();
                fileFeedback = applyList.getComment();
            }


            PleaResult result = pleaResultService.getMidPleaResult(stuId);

            Integer defenseScore;
            String defenseFeedback;

            if (result == null) {
                //前端要求，用于判断渲染
                defenseScore = -1;
                defenseFeedback = "暂无反馈！";
            } else {
                defenseScore = result.getScore();
                defenseFeedback = result.getFeedback();
            }

            Double midScore;
            if (fileScore == -1 || defenseScore == -1) {
                midScore = -1D;
            } else {
                midScore = (weight.getMiddleMaterial() * fileScore + weight.getMiddlePlea() * defenseScore) / 100;
            }


            LinkedHashMap<String, Object> map = new LinkedHashMap<>();
            map.put("fileScore", fileScore);
            map.put("fileFeedback", fileFeedback);
            map.put("defenseScore", defenseScore);
            map.put("defenseFeedback", defenseFeedback);
            map.put("midScore", midScore);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"), map);
        } catch (GmsException e) {
            String message = "查询失败";
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C500.getCode(),
                    Code.C500.getDesc(),
                    message + " : " + e.getMessage()));
        } catch (NullPointerException e) {
            String message = "暂未出分";
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C500.getCode(),
                    Code.C500.getDesc(),
                    message));
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    @GetMapping("score/fin")
    public GmsResponse getFinishScore() throws GmsException {
        try {
            Weight weight = weightService.getWeight();
            Integer stuId = AccountUtil.getCurrentStudent().getStuId();
            Thesis thesis = thesisService.getMyThesis(stuId);

            Integer thesisScore;
            if (thesis == null) {
                //前端要求，用于判断渲染
                thesisScore = -1;
            } else {
                thesisScore = thesis.getScore();
            }


            PleaResult result = pleaResultService.getFinResult(stuId);

            Integer defenseScore;
            String defenseFeedback;

            if (result == null) {
                //前端要求，用于判断渲染
                defenseScore = -1;
                defenseFeedback = "暂无反馈！";
            } else {
                defenseScore = result.getScore();
                defenseFeedback = result.getFeedback();
            }

            Double finScore;
            if (thesisScore == -1 || defenseScore == -1) {
                finScore = -1D;
            } else {
                finScore = (weight.getEndMaterial() * thesisScore + weight.getEndPlea() * defenseScore) / 100;
            }

            LinkedHashMap<String, Object> map = new LinkedHashMap<>();
            map.put("thesisScore", thesisScore);
            map.put("defenseScore", defenseScore);
            map.put("defenseFeedback", defenseFeedback);
            map.put("finScore", finScore);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"), map);
        } catch (GmsException e) {
            String message = "查询失败";
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C500.getCode(),
                    Code.C500.getDesc(),
                    message + " : " + e.getMessage()));
        } catch (NullPointerException e) {
            String message = "暂未出分";
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C500.getCode(),
                    Code.C500.getDesc(),
                    message));
        } catch (Exception e) {
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
                    "查询成功"), statistics);
        } catch (GmsException e) {
            String message = "查询失败";
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C500.getCode(),
                    Code.C500.getDesc(),
                    message + " : " + e.getMessage()));
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }


    @GetMapping("student/allScore")
    public GmsResponse getStudentAllScore() throws GmsException {
        try {
            Integer stuId = AccountUtil.getCurrentStudent().getStuId();
            TotalScore score = totalScoreService.getAllScoreAsStudent(stuId);

            Float finalScore = score.getTotalScore();
            if (finalScore == null) {
                score.setRank("总成绩暂未出分！");
            }
            if (finalScore < 60) {
                score.setRank("不及格");
            } else if (finalScore < 70) {
                score.setRank("一般");
            } else if (finalScore < 80) {
                score.setRank("良好");
            } else if (finalScore < 90) {
                score.setRank("优秀");
            }

            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"), score);
        } catch (GmsException e) {
            String message = "查询失败";
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C500.getCode(),
                    Code.C500.getDesc(),
                    message + " : " + e.getMessage()));
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    @GetMapping("teacher/allScore")
    public GmsResponse getTeacherAllScore(Integer page, Integer size) throws GmsException {
        try {
            // TODO: 2021/3/22 权限
            List<Student> students = appliedSubjectService.getStudentsOfTeacher();
            List<Integer> stuIds = students.stream().map(Student::getStuId).collect(Collectors.toList());
            IPage<TotalScore> scores = totalScoreService.getAllScoreAsTeacher(page, size, stuIds);

            List<TotalScore> scoreList = scores.getRecords();
            for (TotalScore score : scoreList) {
                Float finalScore = score.getTotalScore();
                if (finalScore == null) {
                    score.setRank("总成绩暂未出分！");
                } else if (finalScore < 60) {
                    score.setRank("不及格");
                } else if (finalScore < 70) {
                    score.setRank("一般");
                } else if (finalScore < 80) {
                    score.setRank("良好");
                } else if (finalScore < 90) {
                    score.setRank("优秀");
                }
            }
            scores.setRecords(scoreList);


            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"), scores);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

}

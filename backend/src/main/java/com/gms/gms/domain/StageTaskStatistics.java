package com.gms.gms.domain;

import lombok.Data;

import java.util.List;

@Data
public class StageTaskStatistics {

    //布置任务
    private Integer totalTask;

    //通过任务
    private Integer passedTask;

    //平均得分
    private Float avgScore;

    //驳回次数
    private Integer rejectTimes;

    List<StageTaskStatisticsDetail> detailList;


}

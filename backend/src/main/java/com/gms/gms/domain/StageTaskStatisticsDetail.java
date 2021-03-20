package com.gms.gms.domain;

import lombok.Data;

@Data
public class StageTaskStatisticsDetail {
    //每个任务：
    private Integer taskId;

    private String  taskName;

    private Integer finalScore;

    private Integer retries;


}

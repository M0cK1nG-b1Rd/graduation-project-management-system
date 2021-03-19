package com.gms.gms.domain;

public class StageTaskStatistics {

    //布置任务
    private Integer totalTask;
    //SELECT COUNT(DISTINCT TASK_ID) FROM stage_task WHERE STU_ID=1;
    //通过任务
    private Integer passedTask;
    //SELECT COUNT(DISTINCT TASK_ID) FROM stage_task WHERE STU_ID=1 AND `STATUS` = "YTG";
    //平均得分
    private Float avgScore;
//    SELECT
//    AVG(str.SCORE) AS AVG_SCORE
//    FROM
//    stage_task_result str
//    JOIN ( SELECT TASK_ID, MAX( RETRIES ) AS MAX_RETRIES FROM stage_task_result GROUP BY TASK_ID ) mr ON ( mr.TASK_ID = str.TASK_ID )
//    JOIN stage_task st ON ( st.TASK_ID = str.TASK_ID )
//    WHERE
//    st.STU_ID =1
    //驳回次数
    private Integer rejectTimes;
//    SELECT
//    SUM(str.RETRIES) - COUNT(*) AS REJECT_TIMES
//    FROM
//    stage_task_result str
//    JOIN ( SELECT TASK_ID, MAX( RETRIES ) AS MAX_RETRIES FROM stage_task_result GROUP BY TASK_ID ) mr ON ( mr.TASK_ID = str.TASK_ID )
//    JOIN stage_task st ON ( st.TASK_ID = str.TASK_ID )
//    WHERE
//    st.STU_ID =1

    //每个任务：
    private Integer finalScore;

    private Integer retriesTime;
//    SELECT
//    st.TASK_ID,st.TASK_NAME,str.SCORE AS FINAL_SCORE,str.RETRIES
//            FROM
//    stage_task_result str
//    JOIN ( SELECT TASK_ID, MAX( RETRIES ) AS MAX_RETRIES FROM stage_task_result GROUP BY TASK_ID ) mr ON ( mr.TASK_ID = str.TASK_ID )
//    JOIN stage_task st ON ( st.TASK_ID = str.TASK_ID )
//    WHERE
//    st.STU_ID =1

}

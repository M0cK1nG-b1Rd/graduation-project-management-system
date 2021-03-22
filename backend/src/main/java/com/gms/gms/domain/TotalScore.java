package com.gms.gms.domain;

import lombok.Data;

@Data
public class TotalScore {
    private Integer stuId;
    private String stuName;
    private String subName;
    private String zone;
    private Float startMaterialScore;
    private Float middleMaterialScore;
    private Float endMaterialScore;
    private Float startPleaScore;
    private Float middlePleaScore;
    private Float endPleaScore;
    private Float startScore;
    private Float middleScore;
    private Float endScore;
    private Float procedureScore;
    private Float totalScore;
    private String rank;
}

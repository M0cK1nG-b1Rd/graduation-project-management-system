package com.gms.gms.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TotalScoreStatistics {
    private Double startGreaterThan;
    private Double midGreaterThan;
    private Double finGreaterThan;
    private Double stageTaskGreaterThan;
    private Double totalGreaterThan;
}

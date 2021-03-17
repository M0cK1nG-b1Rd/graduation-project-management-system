package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @author MrBird
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class ReportScore implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId("REPORT_ID")
    private Integer reportId;

    @TableField("FILE_SCORE")
    private Integer fileScore;

    @TableField("FILE_SCORE_WEIGHT")
    private Double fileScoreWeight;

    @TableField("DEFENSE_SCORE")
    private Integer defenseScore;

    @TableField("DEFENSE_SCORE_WEIGHT")
    private Double defenseScoreWeight;

    @TableField("IS_RELEASED")
    private Boolean isReleased;

}

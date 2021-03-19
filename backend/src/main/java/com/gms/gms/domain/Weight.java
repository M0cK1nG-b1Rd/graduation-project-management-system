package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 *
 *
 * @author MrBird
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Weight implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableField("START_STAGE")
    private Double startStage;

    @TableField("MIDDLE_STAGE")
    private Double middleStage;

    @TableField("END_STAGE")
    private Double endStage;

    @TableField("STAGE_TASK")
    private Double stageTask;

    @TableField("START_MATERIAL")
    private Double startMaterial;

    @TableField("START_PLEA")
    private Double startPlea;

    @TableField("MIDDLE_MATERIAL")
    private Double middleMaterial;

    @TableField("MIDDLE_PLEA")
    private Double middlePlea;

    @TableField("END_MATERIAL")
    private Double endMaterial;

    /**
     * 即论文
     */
    @TableField("END_PLEA")
    private Double endPlea;


}

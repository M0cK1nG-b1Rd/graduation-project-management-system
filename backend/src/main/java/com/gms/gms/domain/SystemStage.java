package com.gms.gms.domain;

import java.sql.Time;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 系统当前状态
 *
 * @author MrBird
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class SystemStage implements Serializable {

    private static final long serialVersionUID = 1L;

        @TableField("IS_CURRENT")
    private Boolean isCurrent;

        @TableField("STAGE_ID")
    private Integer stageId;

        @TableField("STAGE_NAME")
    private String stageName;

        @TableField("DESCRIPTION")
    private String description;

        @TableField("START_TIME")
    private Date startTime;

        @TableField("END_TIME")
    private Date endTime;


}

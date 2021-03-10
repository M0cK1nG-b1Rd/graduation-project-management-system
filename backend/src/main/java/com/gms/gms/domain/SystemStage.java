package com.gms.gms.domain;

import java.sql.Time;
import java.time.LocalDateTime;

import com.baomidou.mybatisplus.annotation.TableField;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

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
    @TableId
    private Integer stageId;

    @TableField("STAGE_NAME")
    private String stageName;

    @TableField("DESCRIPTION")
    private String description;

    @TableField("START_TIME")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd")
    private Date startTime;

    @TableField("END_TIME")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd")
    private Date endTime;


}

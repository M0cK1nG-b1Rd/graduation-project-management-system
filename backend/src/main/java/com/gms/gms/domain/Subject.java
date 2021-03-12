package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 课题
 *
 * @author MrBird
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Subject implements Serializable {

    private static final long serialVersionUID = 1L;

        @TableField("DOC_ID")
    private Integer docId;

        @TableField("SUB_NAME")
    private String subName;

        @TableField("DESCRIPTION")
    private String description;

        @TableField("POSE_BY")
    private Integer poseBy;

            @TableId("SUB_ID")
    private Integer subId;

        @TableField("GIV_SUB_ID")
    private Integer givSubId;

        @TableField("STATUS")
    private Integer status;

        @TableField("MAJOR_ID")
    private Integer majorId;


}

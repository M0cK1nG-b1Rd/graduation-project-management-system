package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.TableId;
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
public class Classroom implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId("CLASSROOM_ID")
    private Integer classroomId;

    @TableField("CLASSROOM_NAME")
    private String classroomName;

}

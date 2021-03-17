package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;

import java.io.File;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

import io.swagger.models.auth.In;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * 选题
 *
 * @author MrBird
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@AllArgsConstructor
@NoArgsConstructor
public class AppliedSubject implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId("ID")
    private Integer id;

    @TableField("SUB_ID")
    private String subId;

    @TableField("STU_ID")
    private Integer stuId;

    @TableField("APPLY_TIME")
    private Date applyTime;

    @TableField("APPLY_REASON")
    private String applyReason;

    @TableField("DOC_ID")
    private String docId;

    //在数据字典中
    @TableField("STATUS")
    private String status;

    @TableField("FEEDBACK")
    private String feedback;

    @TableField("AUDIT_BY")
    private Integer auditBy;

    @TableField("AUDIT_TIME")
    private Date auditTime;

    //分页参数
    @TableField(exist = false)
    private Integer page;

    @TableField(exist = false)
    private Integer size;

    //补充细节的参数
    @TableField(exist = false)
    private String subName;
    @TableField(exist = false)
    private Integer teacherId;
    @TableField(exist = false)
    private String teacherName;
    @TableField(exist = false)
    private Integer studentId;
    @TableField(exist = false)
    private String studentName;


    //搜索关键字
    @TableField(exist = false)
    private String keyWord;

    @TableField(exist = false)
    private List<FileStorage> fileStorage;

}

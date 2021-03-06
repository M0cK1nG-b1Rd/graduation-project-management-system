package com.gms.gms.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * 公告
 *
 * @author MrBird
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Announcement implements Serializable{

    private static final long serialVersionUID = 1L;

    @TableField("DOC_ID")
    private String docId;

    @TableId(value = "ANN_ID",type = IdType.AUTO)
    private Integer annId;

    @TableField("ANN_TITLE")
    private String annTitle;

    @TableField("CREATE_BY")
    private Integer createBy;

    @TableField("ANN_DETAIL")
    private String annDetail;

    @TableField("TYPE")
    private String type;

    @TableField("STATUS")
    private String status;

    @TableField("SIGNATURE")
    private String signature;

    @TableField("CREATE_TIME")
    private Date createTime;

    @TableField(exist = false)
    private int page=1,size=10;

    @TableField(exist = false)
    private String keyWord;

}

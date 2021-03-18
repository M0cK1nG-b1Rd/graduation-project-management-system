package com.gms.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Message implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "MESSAGE_ID", type = IdType.AUTO)
    private Long messageId;

    @TableField("FROM_ID")
    private Integer fromId;

    @TableField("TO_ID")
    private Integer toId;

    @TableField("TITLE")
    private String title;

    @TableField("TYPE")
    private String type;

    @TableField("DETAIL")
    private String detail;

    @TableField("CREAT_TIME")
    private LocalDateTime creatTime;

    private transient String realName;
}

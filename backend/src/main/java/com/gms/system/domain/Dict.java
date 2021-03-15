package com.gms.system.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;


@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
//todo 修改字典表
public class Dict implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableField("DICT_ID")
    private Integer dictId;

    @TableField("DICT_NAME")
    private String dictName;

    @TableField("DICT_KEY")
    private String dictKey;

    @TableField("ORDER_ID")
    private Integer orderId;

    @TableField("DICT_VALUE")
    private String dictValue;


}

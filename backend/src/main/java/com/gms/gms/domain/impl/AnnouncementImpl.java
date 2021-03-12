package com.gms.gms.domain.impl;

import com.gms.gms.domain.Announcement;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

//该类为辅助类，用于实现公告搜索的相关要求
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class AnnouncementImpl extends Announcement {
    private int page=1,size=10;
    private String keyWord;
}

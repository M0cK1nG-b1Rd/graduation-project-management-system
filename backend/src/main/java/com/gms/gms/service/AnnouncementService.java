package com.gms.gms.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.gms.gms.domain.Announcement;


import java.util.List;

/**
 * @author MrBird
 */
public interface AnnouncementService extends IService<Announcement> {
    IPage<Announcement> getAnnouncement(String keyWord, int type,int page, int size, int status);

    void updateAnnouncement(Announcement announcement);

    void addAnnouncement(Announcement announcement);

    void deleteAnnouncements(List<Integer> annIds);

    List<Announcement> getPublishedAnnouncement();
}

package com.gms.gms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.gms.gms.domain.Announcement;


import java.util.List;

/**
 * @author MrBird
 */
public interface AnnouncementService extends IService<Announcement> {
    Page<Announcement> getAnnouncement(Announcement announcement);

    void updateAnnouncement(Announcement announcement);

    void addAnnouncement(Announcement announcement ,String docId);

    void deleteAnnouncements(List<Integer> annIds);

    //List<Announcement> getPublishedAnnouncement();
}

package com.gms.gms.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.gms.domain.Announcement;
import com.gms.gms.service.AnnouncementService;
import io.swagger.models.auth.In;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author MrBird
 */
@Slf4j
@Validated
@RestController
@RequestMapping("announcement")
public class AnnouncementController {
    @Autowired
    AnnouncementService announcementService;

    //该方法用于普通用户在公告栏查询公告
    @GetMapping
    public GmsResponse getAnnouncement(String keyWord,int type,int page,int size) throws GmsException {
        try {
            IPage<Announcement> announcement = announcementService.getAnnouncement(keyWord,type,page,size);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"), announcement);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }


    @GetMapping("published")
    public GmsResponse getPublishedAnnouncement() throws GmsException {
        try {
            List<Announcement> announcement = announcementService.getPublishedAnnouncement();
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"), announcement);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    @PostMapping
    public GmsResponse addAnnouncement(Announcement announcement) throws GmsException {
        try {
            announcementService.addAnnouncement(announcement);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "新建公告成功"), announcement);
        } catch (Exception e) {
            String message = "新建失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    @PutMapping
    public GmsResponse updateAnnouncement(Announcement announcement) throws GmsException {
        try {
            announcementService.updateAnnouncement(announcement);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "修改公告成功"));
        } catch (Exception e) {
            String message = "修改失败";
            log.error(message, e);
            throw new GmsException(message);
        }

    }

    @DeleteMapping
    public GmsResponse deleteAnnouncements(List<Integer> annIds) throws GmsException {
        try {
            announcementService.deleteAnnouncements(annIds);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "删除公告成功"));
        } catch (Exception e) {
            String message = "删除失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }
}

package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gms.gms.dao.AnnouncementMapper;
import com.gms.gms.domain.Announcement;
import com.gms.gms.service.AnnouncementService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author MrBird
 */
@Service
public class AnnouncementServiceImpl extends ServiceImpl<AnnouncementMapper, Announcement> implements AnnouncementService {

    @Override
    public List<Announcement> getAnnouncement() {
        return this.baseMapper.selectList(new LambdaQueryWrapper<>());
    }

    @Override
    public void updateAnnouncement(Announcement announcement) {
        this.baseMapper.updateById(announcement);
    }

    @Override
    public void addAnnouncement(Announcement announcement) {
        this.save(announcement);
    }

    @Override
    public void deleteAnnouncements(List<Integer> annIds) {
        this.baseMapper.deleteBatchIds(annIds);
    }
}
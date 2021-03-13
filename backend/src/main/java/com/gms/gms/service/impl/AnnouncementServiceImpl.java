package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
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

    //普通用户点击公告栏时看到的信息接口
    @Override
    public IPage<Announcement> getAnnouncement(Announcement announcement) {
        Page<Announcement> page1 = new Page<>(announcement.getPage(), announcement.getSize());
        QueryWrapper<Announcement> announcementQueryWrapper = new QueryWrapper<>();
        if(announcement.getStatus()!=null){
            announcementQueryWrapper.eq("STATUS",announcement.getStatus());
        }
        if(announcement.getType()!=null){
            announcementQueryWrapper.eq("TYPE",announcement.getType());
        }
        if (announcement.getKeyWord() != null && announcement.getKeyWord().length() > 0) {
            announcementQueryWrapper.and(i->i.like("ANN_TITLE",announcement.getKeyWord()).or().like("ANN_DETAIL",announcement.getKeyWord()));
            //announcementQueryWrapper.like("ANN_TITLE", announcement.getKeyWord()).or().like("ANN_DETAIL", announcement.getKeyWord());
        }
        announcementQueryWrapper.orderByDesc("CREATE_TIME");
        return this.baseMapper.selectPage(page1, announcementQueryWrapper);
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

    @Override
    public List<Announcement> getPublishedAnnouncement() {
        LambdaQueryWrapper<Announcement> queryWrapper = new LambdaQueryWrapper<>();
        //在数据字典中，2为已发布，1为未发布
        queryWrapper.eq(Announcement::getStatus,2);
        return this.baseMapper.selectList(queryWrapper);
    }
}

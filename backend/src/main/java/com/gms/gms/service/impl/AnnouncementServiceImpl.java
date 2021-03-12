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

    @Override
    public IPage<Announcement> getAnnouncement(String keyWord, int type,int page, int size) {
        Page<Announcement> page1 = new Page<>(page, size);
        QueryWrapper<Announcement> announcementQueryWrapper = new QueryWrapper<>();
        announcementQueryWrapper.eq("STATUS", 2).eq("TYPE",type);
        if (keyWord != null && keyWord.length() > 0) {
            announcementQueryWrapper.like("ANN_TITLE", keyWord).or().like("ANN_DETAIL", keyWord);
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

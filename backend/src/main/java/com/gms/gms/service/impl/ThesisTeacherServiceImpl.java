package com.gms.gms.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.dao.AccountMapper;
import com.gms.gms.domain.Thesis;
import com.gms.gms.domain.ThesisHelp;
import com.gms.gms.domain.ThesisTeacher;
import com.gms.gms.dao.ThesisTeacherMapper;
import com.gms.gms.service.ThesisTeacherService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@Service
public class ThesisTeacherServiceImpl extends ServiceImpl<ThesisTeacherMapper, ThesisTeacher> implements ThesisTeacherService {

    @Autowired
    AccountMapper accountMapper;

    @Override
    public void groupTeacherAuto() {
        List<Integer> teacherId = accountMapper.selectAllTeacherId();
        List<Thesis> thesis = this.baseMapper.selectThesisIdAndTeacherId();
        Collections.shuffle(teacherId);
        Collections.shuffle(thesis);
        int tIdSize = teacherId.size();
        int i = 0;
        ThesisTeacher help;
        List<ThesisTeacher> helpList = new ArrayList<>();
        for (Thesis t : thesis) {
            for (int n = 0; n < 3; n++) {
                if (t.getTeacherId() == teacherId.get(i)) {
                    i = (i + 1) % tIdSize;
                }
                help = new ThesisTeacher().setTime(new Date())
                        .setTeacherId(teacherId.get(i))
                        .setThesisId(t.getThesisId());
                helpList.add(help);
                i = (i + 1) % tIdSize;
            }
        }
        this.baseMapper.inserts(helpList);
    }

    @Override
    public Page<ThesisHelp> selectThesisGroupStage(Integer page, Integer size) {
        return this.baseMapper.selectThesisGroupStage(new Page<ThesisHelp>(page, size));
    }

    @Override
    public List<Thesis> selectThesisGroupStageTeacher(Integer teacherId) {
        return this.baseMapper.selectThesisGroupStageTeacher(teacherId);
    }
}

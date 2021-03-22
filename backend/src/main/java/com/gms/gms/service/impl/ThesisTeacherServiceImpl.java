package com.gms.gms.service.impl;

import com.gms.gms.dao.AccountMapper;
import com.gms.gms.domain.Thesis;
import com.gms.gms.domain.ThesisTeacher;
import com.gms.gms.dao.ThesisTeacherMapper;
import com.gms.gms.service.ThesisTeacherService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        int i=0;
        for (Thesis t:thesis){
            if(t.getTeacherId()==teacherId.get(i)){
                i=(i+1)%tIdSize;
            }
            ThesisTeacher help = new ThesisTeacher().setTime(new Date())
                                                    .setTeacherId(teacherId.get(i))
                                                    .setThesisId(t.getThesisId());
            this.baseMapper.insert(help);
        }
    }
}

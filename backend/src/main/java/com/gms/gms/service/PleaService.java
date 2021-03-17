package com.gms.gms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.gms.domain.Plea;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author MrBird
 */
public interface PleaService extends IService<Plea> {

    Page<Plea> getAllPlea(int page, int size, String stage);

    Integer getStuId(Integer userId);

    Integer getGroupId(Integer stuId, String stage);

    List<Plea> getPleaForStudent(Integer groupId, String stage);

    Integer getTeacherId(Integer userId);

    Integer getTeamId(Integer teacherId, String stage);

    List<Plea> getPleaForOther(Integer teamId, String stage);

    Integer getSecId(Integer userId);

    Integer getTeamId1(Integer secId, String stage);
}

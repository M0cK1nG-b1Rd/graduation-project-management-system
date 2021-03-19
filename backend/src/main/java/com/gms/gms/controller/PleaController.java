package com.gms.gms.controller;


import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.common.utils.GmsUtil;
import com.gms.gms.domain.Classroom;
import com.gms.gms.domain.Plea;
import com.gms.gms.service.PleaService;
import com.gms.system.domain.Role;
import com.gms.system.utils.CreatNewMessage;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@Validated
@RestController
@RequestMapping("/plea")
public class PleaController {
    @Autowired
    PleaService pleaService;

    /**
     * 新建答辩分组，传参为JSON
     * stuGroupId:学生组id
     * acceptanceTeamId:老师组id
     * classroomId:教室id
     * startTime:开始时间
     * endTime:结束时间
     * stage:时期
     */
    @PostMapping
    public GmsResponse addNewPlea(@RequestBody Plea plea) throws GmsException {
        try {
            if(plea.getStuGroupId()==null){
                return new GmsResponse().addCodeMessage(new Meta(
                        Code.C500.getCode(),
                        Code.C500.getDesc(),
                        "没有选择学生组"));
            }
            if(plea.getTeacherTeam()==null){
                return new GmsResponse().addCodeMessage(new Meta(
                        Code.C500.getCode(),
                        Code.C500.getDesc(),
                        "没有选择老师组"));
            }
            if (pleaService.count(new QueryWrapper<Plea>().lambda()
                    .nested(i -> i.eq(Plea::getStuGroupId, plea.getStuGroupId()).or().eq(Plea::getAcceptanceTeamId, plea.getAcceptanceTeamId()))
                    .eq(Plea::getStage, plea.getStage())) > 0) {
                return new GmsResponse().addCodeMessage(new Meta(
                        Code.C500.getCode(),
                        Code.C500.getDesc(),
                        "该老师或学生组已安排，无法新建"));
            }
            //使用MybatisPlus封装的方法
            pleaService.save(plea);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "新建答辩安排成功"));
        } catch (Exception e) {
            String message = "新建失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    /**
     * 修改答辩分组，传参为JSON
     * id:答辩安排的id
     * stuGroupId:学生组id
     * acceptanceTeamId:老师组id
     * classroomId:教室id
     * startTime:开始时间
     * endTime:结束时间
     * stage:时期
     */
    @PutMapping
    public GmsResponse updatePlea(@RequestBody Plea plea) throws GmsException {
        try {
            //当存在传入id时，使用id进行接下来的操作，stuGroupId、acceptanceTeamId、stage可以不传
            if (plea.getId() == null) {
                if (pleaService.getOne(new QueryWrapper<Plea>().lambda()
                        .eq(Plea::getStuGroupId, plea.getStuGroupId()).or().eq(Plea::getAcceptanceTeamId, plea.getAcceptanceTeamId())
                        .eq(Plea::getStage, plea.getStage())).getIsRelease()) {
                    return new GmsResponse().addCodeMessage(new Meta(
                            Code.C500.getCode(),
                            Code.C500.getDesc(),
                            "该安排已发布，无法修改"));
                }
                //使用MybatisPlus封装的方法
                pleaService.update(plea, new QueryWrapper<Plea>().lambda()
                        .eq(Plea::getStuGroupId, plea.getStuGroupId()).or().eq(Plea::getAcceptanceTeamId, plea.getAcceptanceTeamId())
                        .eq(Plea::getStage, plea.getStage()));
                return new GmsResponse().addCodeMessage(new Meta(
                        Code.C200.getCode(),
                        Code.C200.getDesc(),
                        "修改成功"));
            }
            if (pleaService.getById(plea.getId()).getIsRelease()) {
                return new GmsResponse().addCodeMessage(new Meta(
                        Code.C500.getCode(),
                        Code.C500.getDesc(),
                        "该安排已发布，无法修改"));
            }
            pleaService.updateById(plea);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "修改成功"));
        } catch (Exception e) {
            String message = "修改失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    /**
     * 获取某阶段所有答辩安排的接口，问号传参
     * page:当前页数
     * size:每页个数
     * stage:时期
     */
    @GetMapping
    public GmsResponse getAllPlea(int page, int size, String stage) throws GmsException {
        try {
            Page<Plea> pleaPage = pleaService.getAllPlea(page, size, stage);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询答辩安排成功"), pleaPage);
        } catch (Exception e) {
            String message = "查询答辩安排失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    /**
     * 一键发布接口，传参为JSON
     * stage:时期
     */
    @PutMapping("/true")
    public GmsResponse updatePleaReleaseTure(@RequestBody JSONObject jsonObject) throws GmsException {
        try {
            String stage=jsonObject.getString("stage");
            pleaService.update(null,new LambdaUpdateWrapper<Plea>().set(Plea::getIsRelease,true).eq(Plea::getStage,stage));
            //发布通知
            CreatNewMessage.creatNewPleaOne(stage);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "答辩安排发布成功！"));
        } catch (Exception e) {
            String message = "答辩安排发布失败！";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    /**
     * 一键撤回接口，传参为JSON
     * stage:时期
     */
    @PutMapping("/false")
    public GmsResponse updatePleaReleaseFalse(@RequestBody JSONObject jsonObject) throws GmsException {
        try {
            String stage=jsonObject.getString("stage");
            pleaService.update(null,new LambdaUpdateWrapper<Plea>().set(Plea::getIsRelease,false).eq(Plea::getStage,stage));
            //TODO 发布通知预留地
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "答辩已成功取消发布！"));
        } catch (Exception e) {
            String message = "取消发布答辩安排失败！";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    /**
     * 一键删除接口，删除所有传参阶段的安排，？传参
     * stage:时期
     * 注意，数据中存在外键，可能出现该安排中的学生打分后无法删除的情况
     * 建议只在答辩安排时使用，正式开始答辩后不使用
     */
    @DeleteMapping
    public GmsResponse deletePleaRelease(String stage) throws GmsException {
        try {
            pleaService.remove(new QueryWrapper<Plea>().lambda().eq(Plea::getStage,stage));
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "删除答辩安排成功"));
        } catch (Exception e) {
            String message = "删除失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }


    /**
     * 用户获取自己的相应时期答辩安排的接口，传参为？
     * stage:时期
     */
    @GetMapping("/user")
    public GmsResponse getPlea(String stage) throws GmsException {
        try {
            Role Role = GmsUtil.getUserRoles().get(0);
            Integer userId=GmsUtil.getCurrentUser().getUserId();
            List<Plea> plea;
            if("学生".equals(Role.getRoleName())){
                Integer stuId = pleaService.getStuId(userId);
                Integer groupId = pleaService.getGroupId(stuId,stage);
                if(groupId==null){
                    return new GmsResponse().addCodeMessage(new Meta(
                            Code.C500.getCode(),
                            Code.C500.getDesc(),
                            "没有分组"));
                }
                plea = pleaService.getPleaForStudent(groupId,stage);
                if (plea.size()==0){
                    return new GmsResponse().addCodeMessage(new Meta(
                            Code.C500.getCode(),
                            Code.C500.getDesc(),
                            "没有分组"));
                }
            }else if("老师".equals(Role.getRoleName())){
                Integer teacherId = pleaService.getTeacherId(userId);
                Integer teamId1 = pleaService.getTeamId(teacherId,stage);
                if(teamId1==null){
                    return new GmsResponse().addCodeMessage(new Meta(
                            Code.C500.getCode(),
                            Code.C500.getDesc(),
                            "没有分组"));
                }
                plea = pleaService.getPleaForOther(teamId1,stage);
                if (plea.size()==0){
                    return new GmsResponse().addCodeMessage(new Meta(
                            Code.C500.getCode(),
                            Code.C500.getDesc(),
                            "没有分组"));
                }
            }else if ("答辩秘书".equals(Role.getRoleName())){
                Integer secId = pleaService.getSecId(userId);
                Integer teamId = pleaService.getTeamId1(secId,stage);
                if(teamId==null){
                    return new GmsResponse().addCodeMessage(new Meta(
                            Code.C500.getCode(),
                            Code.C500.getDesc(),
                            "没有分组"));
                }
                plea = pleaService.getPleaForOther(teamId,stage);
                if (plea.size()==0){
                    return new GmsResponse().addCodeMessage(new Meta(
                            Code.C500.getCode(),
                            Code.C500.getDesc(),
                            "没有分组"));
                }
            }else {
                return new GmsResponse().addCodeMessage(new Meta(
                        Code.C500.getCode(),
                        Code.C500.getDesc(),
                        "当前用户无分组"));
            }
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"), plea);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }
}


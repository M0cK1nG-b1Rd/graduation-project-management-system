package com.gms.system.controller;

import com.gms.common.annotation.Log;
import com.gms.common.controller.BaseController;
import com.gms.common.domain.GmsConstant;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.domain.QueryRequest;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.system.domain.Dict;
import com.gms.system.service.DictService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.wuwenze.poi.ExcelKit;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Slf4j
@Validated
@RestController
@RequestMapping("dict")
public class DictController extends BaseController {

    private String message;

    @Autowired
    private DictService dictService;

    @GetMapping("all")
    public GmsResponse getDictList() throws GmsException {
        try {
            List<Dict> dicts = dictService.getAllDict();
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"),dicts);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

    @GetMapping("{dictName}")
    public GmsResponse DictTrimList(@PathVariable String dictName) throws GmsException {
        try {
            List<Dict> dicts = dictService.getDictByName(dictName);
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询成功"),dicts);
        } catch (Exception e) {
            String message = "查询失败";
            log.error(message, e);
            throw new GmsException(message);
        }


    }

//    @Log("新增字典")
//    @PostMapping
//    @RequiresPermissions("dict:add")
//    public GmsResponse addDict(@RequestBody @Valid Dict dict) throws GmsException {
//        try {
//            this.dictService.createDict(dict);
//            return new GmsResponse().code("200").message("新增字典成功").status("success");
//        } catch (Exception e) {
//            message = "新增字典失败";
//            log.error(message, e);
//            throw new GmsException(message);
//        }
//    }
//
//    @Log("删除字典")
//    @DeleteMapping("/{dictIds}")
//    @RequiresPermissions("dict:delete")
//    public GmsResponse deleteDicts(@NotBlank(message = "{required}") @PathVariable String dictIds) throws GmsException {
//        try {
//            String[] ids = dictIds.split(StringPool.COMMA);
//            this.dictService.deleteDicts(ids);
//            return new GmsResponse().code("200").message("删除字典成功").status("success");
//        } catch (Exception e) {
//            message = "删除字典失败";
//            log.error(message, e);
//            throw new GmsException(message);
//        }
//    }
//
//    @Log("修改字典")
//    @PutMapping
//    @RequiresPermissions("dict:update")
//    public GmsResponse updateDict(@RequestBody @Valid Dict dict) throws GmsException {
//        try {
//            this.dictService.updateDict(dict);
//            return new GmsResponse().code("200").message("修改字典成功").status("success");
//        } catch (Exception e) {
//            message = "修改字典失败";
//            log.error(message, e);
//            throw new GmsException(message);
//        }
//    }
//
//    @PostMapping("excel")
//    @RequiresPermissions("dict:export")
//    public void export(QueryRequest request,@RequestBody Dict dict, HttpServletResponse response) throws GmsException {
//        try {
//            List<Dict> dicts = this.dictService.findDicts(request, dict).getRecords();
//            ExcelKit.$Export(Dict.class, response).downXlsx(dicts, false);
//        } catch (Exception e) {
//            message = "导出Excel失败";
//            log.error(message, e);
//            throw new GmsException(message);
//        }
//    }
}

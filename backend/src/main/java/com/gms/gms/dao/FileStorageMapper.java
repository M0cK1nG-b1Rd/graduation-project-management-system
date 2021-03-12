package com.gms.gms.dao;

import com.gms.gms.domain.FileStorage;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * @author MrBird
 */
public interface FileStorageMapper extends BaseMapper<FileStorage> {

    List<FileStorage> selectAllFiles();
}

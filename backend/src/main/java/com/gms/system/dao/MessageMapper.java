package com.gms.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gms.system.domain.Message;
import org.apache.ibatis.annotations.Param;

/**
 * @author MrBird
 */
public interface MessageMapper extends BaseMapper<Message> {

    Page<Message> getMessage(Page<Message> messagePage,@Param("userId") int userId);
}

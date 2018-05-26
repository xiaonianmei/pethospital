package com.erdong.warehouse.service;

import com.erdong.warehouse.model.DataGrid;
import com.erdong.warehouse.pojo.LayResult;
import com.erdong.warehouse.pojo.ManagerDto;
import com.erdong.warehouse.pojo.Quick;
import com.erdong.warehouse.pojo.User;
import com.github.pagehelper.PageInfo;

import java.util.List;


/**
 * @author Levin
 * @version 2.5.1
 * @since 2018-01-10
 */
public interface QuickService {


       Integer userQuick(String describe,long userId,String title);

       List<Quick> selectByUserId(Long userId, DataGrid grid);

       LayResult<Quick> selectBy(Integer limit, Integer page);

       int updateByPrimaryKeySelective(Quick record);
}

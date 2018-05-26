package com.erdong.warehouse.service;

import com.erdong.warehouse.model.DataGrid;
import com.erdong.warehouse.pojo.LayResult;
import com.erdong.warehouse.pojo.ManagerDto;
import com.erdong.warehouse.pojo.User;
import com.github.pagehelper.PageInfo;


/**
 * @author Levin
 * @version 2.5.1
 * @since 2018-01-10
 */
public interface UserService {


       User login(String account, String password);

       Integer chcekAcount(String account);

       User save(User record);

       int updateByPrimaryKeySelective(User record);

       LayResult<User> selectBy(Integer limit, Integer page);
}

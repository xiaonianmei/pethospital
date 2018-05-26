package com.erdong.warehouse.service;

import com.erdong.warehouse.model.DataGrid;
import com.erdong.warehouse.pojo.Manager;
import com.erdong.warehouse.pojo.ManagerDto;
import com.github.pagehelper.PageInfo;

import java.util.List;


/**
 * @author Levin
 * @version 2.5.1
 * @since 2018-01-10
 */
public interface ManagerService {

    /**
     * 带分页查询账户信息
     *
     * @param grid    分页信息
     * @param name    名称
     * @param account 账户
     * @return 查询结果
     */
    PageInfo<ManagerDto> listManagerByName(DataGrid grid, String name, String account);

    /**
     * 根据账号查询信息
     *
     * @param account 账号
     * @return 查询结果
     */
    ManagerDto selectManagerByAccount(String account);

    Boolean managerEdit(Manager manager);

    Boolean deleteByPrimaryKey(Integer id);

    List<ManagerDto> listManagerByNames();

    List<ManagerDto> listManagerByRole();
}

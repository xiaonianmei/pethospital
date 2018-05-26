package com.erdong.warehouse.service;

import com.erdong.warehouse.model.TreeNode;
import com.erdong.warehouse.pojo.LayResult;
import com.erdong.warehouse.pojo.Menu;
import com.erdong.warehouse.pojo.Role;
import com.github.pagehelper.PageInfo;


import java.util.List;

/**
 * @author Levin
 * @version 2.5.1
 * @since 2018-01-10
 */
public interface MenuService {



    /**
     * 根据角色ID获取树形结构的菜单数据
     *
     * @param roleId 角色ID
     * @return 查询结果
     */
    List<TreeNode> listTree(Integer roleId);

    String selectUrl(Integer url);

    LayResult<Role> selectRols();
}

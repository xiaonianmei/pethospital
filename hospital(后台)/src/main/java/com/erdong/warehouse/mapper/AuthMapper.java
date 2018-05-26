package com.erdong.warehouse.mapper;


import com.erdong.warehouse.pojo.Menu;
import com.erdong.warehouse.pojo.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Levin
 */
@Mapper
public interface AuthMapper {

    /**
     * 根据角色ID查询可操作的菜单
     *
     * @param roleId 角色ID
     * @return 查询结果
     */
    List<Menu> listMenuByRoleId(@Param("roleId") Integer roleId);

    String  selectUrl(@Param("url") Integer url);


    List<Role> selectRols();

    Integer selectRolsAmout();
}

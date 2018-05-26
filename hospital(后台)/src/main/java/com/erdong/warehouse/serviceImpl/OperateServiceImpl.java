package com.erdong.warehouse.serviceImpl;

import com.erdong.warehouse.mapper.OperateMapper;
import com.erdong.warehouse.model.DataGrid;
import com.erdong.warehouse.pojo.Operate;
import com.erdong.warehouse.pojo.OperateDto;
import com.erdong.warehouse.pojo.ShiroPermission;
import com.erdong.warehouse.service.OperateService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Levin
 */
@Service
public class OperateServiceImpl implements OperateService {

    private final OperateMapper operateMapper;

    @Autowired
    public OperateServiceImpl(OperateMapper operateMapper) {
        this.operateMapper = operateMapper;
    }

    @Override
    public List<Operate> listOperateByRoleIdAndMenuId(Integer roleId, Integer menuId) {
        return this.operateMapper.listOperateByRoleIdAndMenuId(roleId, menuId);

    }

    @Override
    public PageInfo<OperateDto> listOperateByPage(DataGrid grid) {
        grid.getOrderBy();
        return PageHelper.startPage(grid.getPageNum(), grid.getPageSize())
                .doSelectPageInfo(this.operateMapper::listOperateByPage);
    }

    @Override
    public List<ShiroPermission> listShiroPermissions(Integer roleId) {
        return this.operateMapper.listShiroPermissionByRoleId(roleId);
    }

}

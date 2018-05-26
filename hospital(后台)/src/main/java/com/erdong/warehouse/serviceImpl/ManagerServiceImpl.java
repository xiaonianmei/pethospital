package com.erdong.warehouse.serviceImpl;

import com.erdong.warehouse.mapper.ManagerMapper;
import com.erdong.warehouse.model.DataGrid;
import com.erdong.warehouse.pojo.Manager;
import com.erdong.warehouse.pojo.ManagerDto;
import com.erdong.warehouse.service.ManagerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Levin
 */
@Service
public class ManagerServiceImpl implements ManagerService {

	private final ManagerMapper managerMapper;

	@Autowired
	public ManagerServiceImpl(ManagerMapper managerMapper) {
		this.managerMapper = managerMapper;
	}

	@Override
	public PageInfo<ManagerDto> listManagerByName(DataGrid grid, String name, String account) {
		grid.getOrderBy();
		return PageHelper.startPage(grid.getPageNum(), grid.getPageSize())
				.doSelectPageInfo(() -> this.managerMapper.listManagerByName(name,account));
	}

	@Override
	public ManagerDto selectManagerByAccount(String account) {
		return this.managerMapper.selectManagerByAccount(account);
	}
	@Override
	public  Boolean managerEdit(Manager manager){
		Boolean result=false;
		if(manager.getId()==null){
			result= managerMapper.insertSelective(manager);
			return result;
		}else{
			result=managerMapper.updateByPrimaryKeySelective(manager);
		}
		return result;
	}
	@Override
	public Boolean deleteByPrimaryKey(Integer id){
		return managerMapper.deleteByPrimaryKey(id);
	}
	@Override
	public List<ManagerDto> listManagerByNames(){
		return managerMapper.listManagerByName(null,null);
	}
	@Override
	public List<ManagerDto> listManagerByRole(){
		return this.managerMapper.listManagerByRole();
	}

}

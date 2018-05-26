package com.erdong.warehouse.serviceImpl;

import com.erdong.warehouse.mapper.ManagerMapper;
import com.erdong.warehouse.mapper.UserMapper;
import com.erdong.warehouse.model.DataGrid;
import com.erdong.warehouse.pojo.LayResult;
import com.erdong.warehouse.pojo.ManagerDto;
import com.erdong.warehouse.pojo.User;
import com.erdong.warehouse.service.ManagerService;
import com.erdong.warehouse.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

/**
 * @author Levin
 */
@Service
public class UserServiceImpl implements UserService {

	private final UserMapper userMapper;

	@Autowired
	public UserServiceImpl(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	@Override
	public User  login(String account,String password){
		HashMap<String,Object> map=new HashMap<>();
		map.put("account",account);
		map.put("password",password);
		System.out.println("password"+password);
		User user=userMapper.login(map);
		if(user!=null&&user.getLock()==0){
			 user.setStatus(0);
		}else if(user!=null&&user.getLock()==1){
			user.setStatus(1);
		}else{
			user.setStatus(2);
		}
		return user;
	}
	@Override
	public Integer chcekAcount(String account){
		return userMapper.chcekAcount(account);
	}
	@Override
	public User save(User record){
		int result=0;
		record.setCreateTime(new Date());
		if(null!=record.getId()){
			result=userMapper.updateByPrimaryKeySelective(record);
		}else {
			record.setLock(0);
			result=userMapper.insertSelective(record);
		}
		if(result==1){
			record.setStatus(0);
		}else {
			record.setStatus(1);
		}
		return record;
	}
	@Override
	public int updateByPrimaryKeySelective(User record){
		return userMapper.updateByPrimaryKeySelective(record);
	}
	@Override
	public LayResult<User> selectBy(Integer limit, Integer page){
		DataGrid dataGrid=new DataGrid();
		dataGrid.setPageNum(page);
		dataGrid.setPageSize(limit);
		dataGrid.getOrderBy();
		//Map<String,Object> map=new HashMap<>();

		PageInfo<User> pageInfo= PageHelper.startPage(dataGrid.getPageNum(), dataGrid.getPageSize())
				.doSelectPageInfo(() -> this.userMapper.selectBy());
		LayResult<User> savingLayResult=new LayResult<User>();
		for(User pre:pageInfo.getList()){
			SimpleDateFormat myFmt2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//等价于now.toLocaleString()
			if(pre.getCreateTime()!=null){
				pre.setDate(myFmt2.format(pre.getCreateTime()));
			}else{
				pre.setDate(null);
			}
			if(pre.getLock()==0){
				pre.setLocks("正常");
			}else {
				pre.setLocks("锁定");
			}
		}
		savingLayResult.setCount(pageInfo.getTotal());
		savingLayResult.setData(pageInfo.getList());
		return savingLayResult;

	}
}

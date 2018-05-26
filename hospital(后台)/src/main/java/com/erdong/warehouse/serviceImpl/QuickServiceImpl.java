package com.erdong.warehouse.serviceImpl;

import com.erdong.warehouse.mapper.QuickMapper;
import com.erdong.warehouse.mapper.UserMapper;
import com.erdong.warehouse.model.DataGrid;
import com.erdong.warehouse.pojo.*;
import com.erdong.warehouse.service.QuickService;
import com.erdong.warehouse.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Levin
 */
@Service
public class QuickServiceImpl implements QuickService {

	private final QuickMapper quickMapper;

	@Autowired
	public QuickServiceImpl(QuickMapper quickMapper) {
		this.quickMapper = quickMapper;
	}

    @Override
	public Integer userQuick(String describe,long userId,String title){
		Quick q=new Quick(userId,describe,new Date(),title);
        return quickMapper.insertSelective(q);
	}
	@Override
	public List<Quick> selectByUserId(Long userId, DataGrid grid){
		List<Quick> list=quickMapper.selectByUserId(userId);
		//grid.getOrderBy();
		for (Quick pre:list ){
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			pre.setDate(formatter.format(pre.getCreateTime()));
		}
		return  list;
	}
	@Override
	public LayResult<Quick> selectBy(Integer limit, Integer page){
		DataGrid dataGrid=new DataGrid();
		dataGrid.setPageNum(page);
		dataGrid.setPageSize(limit);
		dataGrid.getOrderBy();
		//Map<String,Object> map=new HashMap<>();

		PageInfo<Quick> pageInfo= PageHelper.startPage(dataGrid.getPageNum(), dataGrid.getPageSize())
				.doSelectPageInfo(() -> this.quickMapper.selectBy());
		LayResult<Quick> savingLayResult=new LayResult<Quick>();
		for(Quick pre:pageInfo.getList()){
			SimpleDateFormat myFmt2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//等价于now.toLocaleString()
			if(pre.getCreateTime()!=null){
				pre.setDate(myFmt2.format(pre.getCreateTime()));
			}else{
				pre.setDate(null);
			}
		}
		savingLayResult.setCount(pageInfo.getTotal());
		savingLayResult.setData(pageInfo.getList());
		return savingLayResult;
	}
	@Override
	public int updateByPrimaryKeySelective(Quick record){
		return quickMapper.updateByPrimaryKeySelective(record);
	}
}

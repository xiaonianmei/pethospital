package com.erdong.warehouse.serviceImpl;

import com.erdong.warehouse.mapper.HospitalMapper;
import com.erdong.warehouse.mapper.PredictMapper;
import com.erdong.warehouse.model.DataGrid;
import com.erdong.warehouse.pojo.Hospital;
import com.erdong.warehouse.pojo.LayResult;
import com.erdong.warehouse.pojo.Predict;
import com.erdong.warehouse.service.HospitalService;
import com.erdong.warehouse.service.PredictService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Levin
 */
@Service
public class HospitalServiceImpl implements HospitalService {

	private final HospitalMapper hospitalMapper;

	@Autowired
	public HospitalServiceImpl(HospitalMapper hospitalMapper) {
		this.hospitalMapper = hospitalMapper;
	}

	@Override
	public List<Hospital> selectByUserId(long userId, DataGrid grid){
		//grid.getOrderBy();
		List<Hospital> list=this.hospitalMapper.selectByUserId(userId);
		for (Hospital pre:list ){
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			pre.setDate(formatter.format(pre.getCreateTime()));
		}
		return list;
	}
	public LayResult<Hospital> healthList(Integer limit, Integer page, Long doctorId, String nickname, String firstTime, String secondTime){
		DataGrid dataGrid=new DataGrid();
		dataGrid.setPageNum(page);
		dataGrid.setPageSize(limit);
		dataGrid.getOrderBy();
		Map<String,Object> map=new HashMap<>();
		if(firstTime!=null&&firstTime.length()>0){
			map.put("firstTime",firstTime);
		}
		if(secondTime!=null&&secondTime.length()>0){
			map.put("secondTime",secondTime);
		}
		if(doctorId!=null&&doctorId>0){
			map.put("doctorId",doctorId);
		}
		if(nickname!=null&&nickname.length()>0){
			map.put("nickname",nickname);
		}
		PageInfo<Hospital> pageInfo= PageHelper.startPage(dataGrid.getPageNum(), dataGrid.getPageSize())
				.doSelectPageInfo(() -> this.hospitalMapper.healthList(map));
		LayResult<Hospital> savingLayResult=new LayResult<Hospital>();
		for(Hospital pre:pageInfo.getList()){
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
	public int insertSelective(Hospital record){
		return hospitalMapper.insertSelective(record);
	}
}

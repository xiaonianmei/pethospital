package com.erdong.warehouse.serviceImpl;

import com.erdong.warehouse.mapper.PredictMapper;
import com.erdong.warehouse.mapper.QuickMapper;
import com.erdong.warehouse.model.DataGrid;
import com.erdong.warehouse.pojo.LayResult;
import com.erdong.warehouse.pojo.Predict;
import com.erdong.warehouse.pojo.Quick;
import com.erdong.warehouse.service.PredictService;
import com.erdong.warehouse.service.QuickService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Levin
 */
@Service
public class PredictServiceImpl implements PredictService {

	private final PredictMapper predictMapper;

	@Autowired
	public PredictServiceImpl(PredictMapper predictMapper) {
		this.predictMapper = predictMapper;
	}

    @Override
	public int insertSelective(Predict record){
		return predictMapper.insertSelective(record);
	}

	@Override
	public List<Predict> Predict(long userId, DataGrid grid){
		//grid.getOrderBy();
    List<Predict> list=this.predictMapper.selectByUserId(userId);
    for (Predict pre:list ){
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		pre.setDate(formatter.format(pre.getPredictTime()));
	}
		return list;
	}
	@Override
	public LayResult<Predict> selectBydoctorId(Integer limit, Integer page, Long doctorId, String nickname, String firstTime, String secondTime){
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
		PageInfo<Predict> pageInfo= PageHelper.startPage(dataGrid.getPageNum(), dataGrid.getPageSize())
				.doSelectPageInfo(() -> this.predictMapper.selectBydoctorId(map));
		LayResult<Predict> savingLayResult=new LayResult<Predict>();
		for(Predict pre:pageInfo.getList()){
			SimpleDateFormat myFmt2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//等价于now.toLocaleString()
				if(pre.getPredictTime()!=null){
					pre.setDate(myFmt2.format(pre.getPredictTime()));
				}else{
					pre.setDate(null);
				}
               if(pre.getStatu()==0){
					pre.setSpeed("普通");
			   }else {
				   pre.setSpeed("加急");
			   }
			if(pre.getDeal()==0){
				pre.setDeals("未处理");
			}else {
				pre.setDeals("已处理");
			}
		}
		savingLayResult.setCount(pageInfo.getTotal());
		savingLayResult.setData(pageInfo.getList());
		return savingLayResult;
	}
	@Override
	public int updateByPrimaryKeySelective(Predict record){
		return predictMapper.updateByPrimaryKeySelective(record);
	}
}

package com.erdong.warehouse.service;

import com.erdong.warehouse.model.DataGrid;
import com.erdong.warehouse.pojo.LayResult;
import com.erdong.warehouse.pojo.Predict;
import com.erdong.warehouse.pojo.Quick;
import com.github.pagehelper.PageInfo;

import java.util.List;


/**
 * @author Levin
 * @version 2.5.1
 * @since 2018-01-10
 */
public interface PredictService {


       int insertSelective(Predict record);

       List<Predict> Predict(long userId,DataGrid grid);

       LayResult<Predict> selectBydoctorId(Integer limit, Integer page, Long doctorId,String nickname,String firstTime,String secondTime);

       int updateByPrimaryKeySelective(Predict record);
}

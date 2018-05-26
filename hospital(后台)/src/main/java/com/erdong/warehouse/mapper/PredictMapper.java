package com.erdong.warehouse.mapper;

import com.erdong.warehouse.pojo.Predict;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
@Mapper
public interface PredictMapper {

    int deleteByPrimaryKey(Long id);

    int insert(Predict record);

    int insertSelective(Predict record);

    Predict selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Predict record);

    int updateByPrimaryKey(Predict record);

    List<Predict> selectByUserId(Long userId);

    List<Predict> selectBydoctorId(Map<String,Object> map);
}
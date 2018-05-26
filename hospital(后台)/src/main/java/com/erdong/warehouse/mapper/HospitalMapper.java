package com.erdong.warehouse.mapper;

import com.erdong.warehouse.pojo.Hospital;
import java.util.List;
import java.util.Map;

import com.erdong.warehouse.pojo.LayResult;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
@Mapper
public interface HospitalMapper {

    int deleteByPrimaryKey(Long id);

    int insert(Hospital record);

    int insertSelective(Hospital record);

    Hospital selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Hospital record);

    int updateByPrimaryKey(Hospital record);

    List<Hospital>   selectByUserId(Long userId);

    List<Hospital> healthList(Map<String,Object> map);
}
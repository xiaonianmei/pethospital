package com.erdong.warehouse.mapper;

import com.erdong.warehouse.pojo.Quick;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
@Mapper
public interface QuickMapper {

    int deleteByPrimaryKey(Long id);

    int insert(Quick record);

    int insertSelective(Quick record);

    Quick selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Quick record);

    int updateByPrimaryKey(Quick record);

    List<Quick> selectByUserId(Long userId);

    List<Quick> selectBy();
}
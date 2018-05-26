package com.erdong.warehouse.service;

import com.erdong.warehouse.model.DataGrid;
import com.erdong.warehouse.pojo.LayResult;
import com.erdong.warehouse.pojo.Question;
import com.erdong.warehouse.pojo.Quick;

import java.util.List;


/**
 * @author Levin
 * @version 2.5.1
 * @since 2018-01-10
 */
public interface QuestionkService {


       Integer userQuick(Question question);

       List<Question> selectByPrimary();

       LayResult<Question> selectBy(Integer limit, Integer page);

       int updateByPrimaryKeySelective(Question record);

       List<Question> selectByPrimaryBySearch(String search);
}

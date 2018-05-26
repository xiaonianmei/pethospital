package com.erdong.warehouse.serviceImpl;

import com.erdong.warehouse.mapper.QuestionMapper;
import com.erdong.warehouse.mapper.QuickMapper;
import com.erdong.warehouse.model.DataGrid;
import com.erdong.warehouse.pojo.LayResult;
import com.erdong.warehouse.pojo.Question;
import com.erdong.warehouse.pojo.Quick;
import com.erdong.warehouse.service.QuestionkService;
import com.erdong.warehouse.service.QuickService;
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
public class QuestionServiceImpl implements QuestionkService {

	private final QuestionMapper questionMapper;

	@Autowired
	public QuestionServiceImpl(QuestionMapper questionMapper) {
		this.questionMapper = questionMapper;
	}

    @Override
	public Integer userQuick(Question question){

        return questionMapper.insertSelective(question);
	}
	@Override
	public List<Question> selectByPrimary(){
		List<Question> list=questionMapper.selectByPrimary();
		//grid.getOrderBy();
		return  list;
	}
	@Override
	public LayResult<Question> selectBy(Integer limit, Integer page){
		DataGrid dataGrid=new DataGrid();
		dataGrid.setPageNum(page);
		dataGrid.setPageSize(limit);
		dataGrid.getOrderBy();
		//Map<String,Object> map=new HashMap<>();

		PageInfo<Question> pageInfo= PageHelper.startPage(dataGrid.getPageNum(), dataGrid.getPageSize())
				.doSelectPageInfo(() -> this.questionMapper.selectByPrimary());
		LayResult<Question> savingLayResult=new LayResult<Question>();
		savingLayResult.setCount(pageInfo.getTotal());
		savingLayResult.setData(pageInfo.getList());
		return savingLayResult;
	}
	@Override
	public int updateByPrimaryKeySelective(Question record){
		if(record.getId()!=null){
			return questionMapper.updateByPrimaryKeySelective(record);
		}
		else {
			return questionMapper.insertSelective(record);
		}
	}
	@Override
	public List<Question> selectByPrimaryBySearch(String search){
		Map<String,Object> map =new HashMap<>();
		map.put("search",search);
		return questionMapper.selectByPrimaryBySearch(map);
	}
}

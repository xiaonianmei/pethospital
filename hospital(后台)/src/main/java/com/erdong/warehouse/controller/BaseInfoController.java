package com.erdong.warehouse.controller;


import com.alibaba.fastjson.JSON;
import com.erdong.warehouse.model.SessionUtil;
import com.erdong.warehouse.pojo.*;
import com.erdong.warehouse.service.HospitalService;
import com.erdong.warehouse.service.PredictService;
import com.erdong.warehouse.service.QuickService;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;

@RequestMapping("/baseInfo")
@Controller
public class BaseInfoController {

    private static final Logger logger = LoggerFactory.getLogger(BaseInfoController.class);

    private QuickService quickService;

    private PredictService predictService;

    private HospitalService hospitalService;

    @Autowired
    public BaseInfoController(PredictService predictService,HospitalService hospitalService,QuickService quickService){
        this.predictService=predictService;
        this.hospitalService=hospitalService;
        this.quickService=quickService;
    }



    @RequestMapping("/predict/list")
    @ResponseBody
    public LayResult<Predict> selectBydoctorId(Integer limit, Integer page, Long doctorId, String nickname, String firstTime, String secondTime){
            ManagerDto dto= SessionUtil.getSession();
            return predictService.selectBydoctorId(  limit,  page,dto.getId()==1?null:Long.valueOf(dto.getId().toString()),nickname, firstTime, secondTime);

    }

    @RequestMapping("/health/list")
    @ResponseBody
    public LayResult<Hospital> healthList(Integer limit, Integer page, Long doctorId, String nickname, String firstTime, String secondTime){
        ManagerDto dto= SessionUtil.getSession();
        return hospitalService.healthList(  limit,  page,dto.getId()==1?null:Long.valueOf(dto.getId().toString()),nickname, firstTime, secondTime);

    }

    @RequestMapping("/health/edit")
    public String editHealth(Hospital hospital){
        ManagerDto dto= SessionUtil.getSession();
        hospital.setDoctorId(Long.valueOf(dto.getId().toString()));
        hospital.setCreateTime(new Date());
        hospitalService.insertSelective(hospital);
        Predict pre=new Predict();
        pre.setId(hospital.getPredictId());
        pre.setDeal(1);
        predictService.updateByPrimaryKeySelective(pre);
        return "/baseInfo/health/list";

    }

    @RequestMapping("/quick/list")
    @ResponseBody
    public LayResult<Quick> quickhList(Integer limit, Integer page){
        ManagerDto dto= SessionUtil.getSession();
        return quickService.selectBy(limit,page);

    }


    @RequestMapping("/quick/edit")
    public String editQuick(Quick quick){
        ManagerDto dto= SessionUtil.getSession();
        quick.setDoctorId(Long.valueOf(dto.getId().toString()));
        quick.setResTime(new Date());
        quickService.updateByPrimaryKeySelective(quick);
        return "/baseInfo/quick/list";

    }




}

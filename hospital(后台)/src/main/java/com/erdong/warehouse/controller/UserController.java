package com.erdong.warehouse.controller;

import com.alibaba.fastjson.JSON;
import com.erdong.warehouse.model.DataGrid;
import com.erdong.warehouse.model.SessionUtil;
import com.erdong.warehouse.pojo.*;
import com.erdong.warehouse.service.*;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

     private UserService userService;

    private QuickService quickService;

    private ManagerService managerService;

    private PredictService predictService;

    private HospitalService hospitalService;

    private QuestionkService questionkService;

    @Autowired
    public UserController(UserService userService,QuickService quickService,ManagerService managerService,PredictService predictService,HospitalService hospitalService,QuestionkService questionkService){
        this.userService=userService;
        this.quickService=quickService;
         this.managerService=managerService;
         this.predictService=predictService;
         this.hospitalService=hospitalService;
         this.questionkService=questionkService;
    }

         @RequestMapping("/login")
         @ResponseBody
         public User login(String account, String password ){
             System.out.println(account+"------------------------"+password);
          return  userService.login(account,password);
         }

    @RequestMapping("/updateUser")
    @ResponseBody
    public Integer updateUser(User user){
        return  userService.updateByPrimaryKeySelective(user);
    }
    @RequestMapping("/chcekAcount")
    @ResponseBody
    public Integer chcekAcount(String account){
        return  userService.chcekAcount(account);
    }


    @RequestMapping("/save")
    @ResponseBody
    public User save(User user){
        return  userService.save(user);
    }
    @RequestMapping("/userQuick")
    @ResponseBody
    public Integer userQuick(String describe,long userId,String title){
        return  quickService.userQuick(describe,userId,title);
    }

    @RequestMapping("/selectByUserId")
    @ResponseBody
    public List<Quick> selectByUserId(DataGrid grid, long userId){
        return  quickService.selectByUserId(userId,grid);
    }

    @RequestMapping("/listManagerByRole")
    @ResponseBody
    public List<ManagerDto> listManagerByRole(){
        return  managerService.listManagerByRole();
    }

    @RequestMapping("/addPredic")
    @ResponseBody
    public Integer addPredic(Predict pre,String datetime) throws ParseException {
        pre.setCreateTime(new Date());
        //pre.setPredictTime(new Date());
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        pre.setPredictTime(formatter.parse(datetime));
        pre.setDeal(0);
        return  predictService.insertSelective(pre);
    }

    @RequestMapping("/selectPredictByUserId")
    @ResponseBody
    public List<Predict> selectPredictByUserId(DataGrid grid, long userId){
        return  predictService.Predict(userId,grid);
    }

    @RequestMapping("/selectHospitalByUserId")
    @ResponseBody
    public List<Hospital> selectHospitalByUserId(DataGrid grid, long userId){
        return  hospitalService.selectByUserId(userId,grid);
    }
    @RequestMapping("/sure/role")
    @ResponseBody
    public String sure(){
        ManagerDto dto= SessionUtil.getSession();
        if(dto.getRoleId()==2){
            return JSON.toJSONString("success");
        }else{
            return JSON.toJSONString("fail");
        }
    }
    @RequestMapping("/selectSearch")
    @ResponseBody
    public List<Question> selectSearch(String search){
        if(search!=null&&search.length()>0){
            return  questionkService.selectByPrimaryBySearch(search);
        }else {
            return  questionkService.selectByPrimaryBySearch(null);
        }

    }
}

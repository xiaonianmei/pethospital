package com.erdong.warehouse.controller;

import com.erdong.warehouse.model.DataGrid;
import com.erdong.warehouse.model.SessionUtil;
import com.erdong.warehouse.pojo.*;
import com.erdong.warehouse.service.*;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;

@RequestMapping("/sys")
@Controller
public class SysController {

    private MenuService menuService;

    private ManagerService managerService;

    private UserService userService;

    private QuestionkService QuestionkService;

    @Autowired
    public SysController(MenuService menuService, ManagerService managerService,UserService userService,QuestionkService QuestionkService){
        this.menuService=menuService;
        this.managerService=managerService;
        this.userService=userService;
        this.QuestionkService=QuestionkService;
    }

    @RequestMapping("/role/list")
    @ResponseBody
      public LayResult<Role> roleList(){
       // System.out.println(JSON.toJSONString(menuService.selectRols()));
        return menuService.selectRols();
    }

    @RequestMapping("/manager/list")
    @ResponseBody
    public Object managerList(Integer limit,Integer page,Integer type){
        if(type!=null){
            return managerService.listManagerByNames();
        }
        DataGrid dataGrid=new DataGrid();
        dataGrid.setPageNum(page);
        dataGrid.setPageSize(limit);
        System.out.println(limit+"--"+page);
        LayResult<ManagerDto> list=new LayResult<ManagerDto>();
        PageInfo<ManagerDto> pageInfo= managerService.listManagerByName(dataGrid,null,null);
        list.setData(pageInfo.getList());
        list.setCount(pageInfo.getTotal());
        list.setCode("0");
        // System.out.println(JSON.toJSONString(menuService.selectRols()));
        return list;
    }

    @RequestMapping("/manager/edit")
    public String addmanager(Manager manager, Byte role, RedirectAttributes model){
        if(role!=null){
            manager.setRoleId(role);
        }
        Boolean result=managerService.managerEdit(manager);
        return "/sys/manager/list";
    }

    @RequestMapping("/manager/remove")
    @ResponseBody
    public String remove(Integer id){
        //System.out.println(1);
        Boolean result=managerService.deleteByPrimaryKey(id);
        if(result){
            return "success";
        }
        return "fail";
    }
    @RequestMapping("/user/list")
    @ResponseBody
    public LayResult<User> userList(Integer limit,Integer page){
        // System.out.println(JSON.toJSONString(menuService.selectRols()));
        return userService.selectBy(limit,page);
    }
    @RequestMapping("/user/edit")
    @ResponseBody
    public Integer updateUser(User user){
        return  userService.updateByPrimaryKeySelective(user);
    }


    @RequestMapping("/question/list")
    @ResponseBody
    public LayResult<Question> quickhList(Integer limit, Integer page){
        //ManagerDto dto= SessionUtil.getSession();
        return QuestionkService.selectBy(limit,page);
    }


    @RequestMapping("/question/edit")
    public String editQuick(Question question){
        QuestionkService.updateByPrimaryKeySelective(question);
        return "/sys/question/list";

    }
}

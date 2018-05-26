package com.erdong.warehouse.controller;

import com.erdong.warehouse.model.SessionUtil;
import com.erdong.warehouse.pojo.Manager;
import com.erdong.warehouse.pojo.ManagerDto;
import com.erdong.warehouse.service.MenuService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class IndexController {

    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

    private MenuService menuService;

    @Autowired
    public IndexController(MenuService menuService){
        this.menuService=menuService;
    }

    @RequestMapping(value={"/","/login"})
        public String index(){
             return "login";
        }

    @RequestMapping(value="/loginout")
    public String loginout(){
        if(SessionUtil.getSession()!=null){
            SessionUtil.setSession(null);
        }
        return "redirect:/";
    }

    @RequestMapping(value="/send")
    public String send(Integer url,Model model){
        ///System.out.println(url);
        String urls=menuService.selectUrl(url);
        if(StringUtils.isEmpty(urls)){
            return "denied";
        }
        logger.info(urls+"/list");
        ManagerDto dto= SessionUtil.getSession();
        if(null==dto){
            return "/login";
        }
        model.addAttribute("dto", dto);
        return urls+"/list";
    }

    @RequestMapping(value="/sends")
    public String sends(Integer url){
        System.out.println(url);
        String urls=menuService.selectUrl(url);
        if(StringUtils.isEmpty(urls)){
            return "denied";
        }
        return urls+"/edit";
    }


    @RequestMapping("/show")
    public String show(Model model){
        ManagerDto dto= SessionUtil.getSession();
        if(null==dto){
            return "/login";
        }
        model.addAttribute("dto", dto);
        model.addAttribute("trees", menuService.listTree((Integer) dto.getRoleId().intValue()));
        return "index";
    }

    @RequestMapping("/shows")
    public String shows(Model model){
        return "show";
    }


    @RequestMapping("/logins")
    public String login(Manager manager, RedirectAttributes model){
        // 想要得到 SecurityUtils.getSubject() 的对象．．访问地址必须跟shiro的拦截地址内．不然后会报空指针
        Subject sub = SecurityUtils.getSubject();
        // 用户输入的账号和密码,,存到UsernamePasswordToken对象中..然后由shiro内部认证对比,
        // 认证执行者交由ShiroDbRealm中doGetAuthenticationInfo处理
        // 当以上认证成功后会向下执行,认证失败会抛出异常
        UsernamePasswordToken token = new UsernamePasswordToken(manager.getAccount(), manager.getPassword());
        try {
            sub.login(token);
        } catch (UnknownAccountException e) {
            logger.error("对用户[{}]进行登录验证,验证未通过,用户不存在", manager.getAccount());
            model.addFlashAttribute("msg", "验证未通过,用户不存在");
            token.clear();
            return "redirect:/login";
        } catch (LockedAccountException lae) {
            logger.error("对用户[{}]进行登录验证,验证未通过,账户已锁定", manager.getAccount());
            model.addFlashAttribute("msg", "验证未通过,账户已锁定");
            token.clear();
            return "redirect:/login";
        } catch (ExcessiveAttemptsException e) {
            logger.error("对用户[{}]进行登录验证,验证未通过,错误次数过多", manager.getAccount());
            model.addFlashAttribute("msg", "验证未通过,错误次数过多");
            token.clear();
            return "redirect:/login";
        } catch (AuthenticationException e) {
            logger.error("对用户[{}]进行登录验证,验证未通过,堆栈轨迹如下", manager.getAccount(), e);
            model.addFlashAttribute("msg", "验证未通过,請检查用户名和密码信息");
            token.clear();
            return "redirect:/login";
        }
        return "redirect:/show";
    }
}

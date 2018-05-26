package com.erdong.warehouse.controller;

import com.erdong.warehouse.model.TreeNode;
import com.erdong.warehouse.pojo.Manager;
import com.erdong.warehouse.service.MenuService;
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

import java.util.List;

@Controller
@RequestMapping("/test")
public class TestController {

    private static final Logger logger = LoggerFactory.getLogger(TestController.class);

     private MenuService menuService;

    @Autowired
    public TestController (MenuService menuService){
         this.menuService=menuService;
    }

         @RequestMapping("/test/{id}")
         public String test(@PathVariable Integer id){
             System.out.println(id);
             System.out.println("mei");
             return "show";
         }
    @RequestMapping("/show")
    public String show(Model model){
        model.addAttribute("trees", menuService.listTree(1));
        return "index";
    }
    @RequestMapping("/denied")
    public String denied(Model model){
        System.out.println("denied");
        return "denied";
    }
    @RequestMapping("/login")
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
        return "redirect:/test/show";
    }

}

package xin.yiliya.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import xin.yiliya.pojo.Admin;
import xin.yiliya.service.AdminService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/manage",method = RequestMethod.GET)
public class AdminLoginController {

    @Resource
    AdminService adminService;

    @Resource
    HttpSession httpSession;

    @RequestMapping(value = "/login.html",method = RequestMethod.GET)
    public String loginHTML(){
        return "admin/bgmanagement_login";
    }

    @RequestMapping(value = "/login.do",method = RequestMethod.POST)
    public String loginDo(String adminname,String password){
        Admin admin=adminService.AdminLogin(adminname,password);
        if (admin==null){
            return "redirect:login.html";
        }
        else{
            httpSession.setAttribute("adminBean",admin);
            return "redirect:/admin/OperationOverview.html";
        }
    }

}

package xin.yiliya.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import xin.yiliya.pojo.Admin;
import xin.yiliya.service.AdminService;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    AdminService adminService;

    @RequestMapping(value = "/login.html",method = RequestMethod.GET)
    public String loginHTML(){
        return "admin/bgmanagement_login";
    }

    @RequestMapping(value = "/OperationOverview.html")
    public String OperationOverviewHTML(){
        return "admin/OperationOverview";
    }

    @RequestMapping(value = "/login.do",method = RequestMethod.POST)
    public String loginDo(String adminname,String password){
        Admin admin=adminService.AdminLogin(adminname,password);
        if (admin==null){
            return "redirect:login.html";
        }
        else{
            return "redirect:OperationOverview.html";
        }
    }

}

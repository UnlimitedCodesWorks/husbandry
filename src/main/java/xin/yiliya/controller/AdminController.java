package xin.yiliya.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import xin.yiliya.pojo.Admin;
import xin.yiliya.service.AdminService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    AdminService adminService;

    @Autowired
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
            return "redirect:OperationOverview.html";
        }
    }

    @RequestMapping(value = "/OperationOverview.html",method = RequestMethod.GET)
    public String OperationOverviewHTML(){
        if(httpSession.getAttribute("adminBean")!=null){
            return "admin/OperationOverview";
        }
        else{
            return "redirect:login.html";
        }
    }

    @RequestMapping(value = "/priceControll.html",method = RequestMethod.GET)
    public String priceControllHTML(){
        if(httpSession.getAttribute("adminBean")!=null){
            return "admin/priceControll";
        }
        else{
            return "redirect:login.html";
        }
    }

    @RequestMapping(value = "/scoreAdmin.html",method = RequestMethod.GET)
    public String scoreAdminHTML(){
        if(httpSession.getAttribute("adminBean")!=null){
            return "admin/priceControll";
        }
        else{
            return "redirect:login.html";
        }
    }

    @RequestMapping(value = "/serviceAdmin.html",method = RequestMethod.GET)
    public String serviceAdminHTML(){
        if(httpSession.getAttribute("adminBean")!=null){
            return "admin/serviceAdmin";
        }
        else{
            return "redirect:login.html";
        }
    }

    @RequestMapping(value = "/useStore.html",method = RequestMethod.GET)
    public String useStoreHTML(){
        if(httpSession.getAttribute("adminBean")!=null){
            return "admin/useStore";
        }
        else{
            return "redirect:login.html";
        }
    }

    @RequestMapping(value = "/waitStore.html",method = RequestMethod.GET)
    public String waitStore(){
        if(httpSession.getAttribute("adminBean")!=null){
            return "admin/waitStore";
        }
        else{
            return "redirect:login.html";
        }
    }
}

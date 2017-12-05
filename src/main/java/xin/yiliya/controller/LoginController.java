package xin.yiliya.controller;

import org.apache.http.protocol.HTTP;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import xin.yiliya.pojo.User;
import xin.yiliya.service.UserService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/all")
public class LoginController {

    @Autowired
    UserService userService;

    @Autowired
    HttpSession httpSession;

    @RequestMapping(value = "/login.html",method = RequestMethod.GET)
    public String loginHTML(){
        return "login";
    }

    @RequestMapping(value = "/userLogin.do",method = RequestMethod.POST)
    public String userLoginDo(String username,String password){
        User user=userService.userLogin(username,password);
        if(user==null){
            return "redirect:login.html";
        }
        else{
            httpSession.setAttribute("userBean",user);
            return "redirect:/index.html";
        }
    }

}

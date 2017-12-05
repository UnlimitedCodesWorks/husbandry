package xin.yiliya.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import xin.yiliya.pojo.RegisterUser;
import xin.yiliya.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class RegisterUserController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/registerUser.html",method = RequestMethod.GET)
    public ModelAndView registerUserHTML(){
        return new ModelAndView("register_user","command",new RegisterUser());
    }

    @RequestMapping(value = "/registerUser.do",method = RequestMethod.POST)
    public String registerUserDo(RegisterUser registerUser){
        Boolean b=userService.userRegister(registerUser);
        return "redirect:/all/login.html";
    }

}

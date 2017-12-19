package xin.yiliya.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.yiliya.pojo.Cities;
import xin.yiliya.pojo.RegisterUser;
import xin.yiliya.service.RegionService;
import xin.yiliya.service.UserService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/user")
public class RegisterUserController {

    @Resource
    private UserService userService;

    @Resource
    private RegionService regionService;

    @RequestMapping(value = "/registerUser.html",method = RequestMethod.GET)
    public String registerUserHTML(Model model){
        Map<String,String> provinces = regionService.getAllProvinces();
        model.addAttribute("provinces",provinces);
        model.addAttribute("registerUser",new RegisterUser());
        return "register_user";
    }

    @RequestMapping(value = "/getCitys.do",method = RequestMethod.POST)
    @ResponseBody
    public List<Cities> getCitys(String provinceId){
        return regionService.getAllCitiesByProvince(provinceId);
    }

    @RequestMapping(value = "/registerUser.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean registerUserDo(RegisterUser registerUser){
        return userService.userRegister(registerUser);
    }

}

package xin.yiliya.controller;

import com.alibaba.fastjson.JSON;
import org.apache.http.protocol.HTTP;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.yiliya.pojo.UpdateUser;
import xin.yiliya.pojo.User;
import xin.yiliya.service.RegionService;
import xin.yiliya.service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;

@Controller
@RequestMapping(value = "/userResident")
public class UserResidentController extends BaseController {

    @Resource
    private HttpSession session;

    @Resource
    private RegionService regionService;

    @Resource
    private UserService userService;

    @RequestMapping(value = "/information.html",method = RequestMethod.GET)
    public String information(Model model){
        User user = (User) session.getAttribute("userBean");
        model.addAttribute("user",user);
        model.addAttribute("updateUser",new UpdateUser());
        model.addAttribute("provinces",regionService.getAllProvinces());
        String provinceId = user.getCities().getProvinces().getProvinceId();
        model.addAttribute("cities",regionService.getAllCitiesByProvince(provinceId));
        model.addAttribute("format",new SimpleDateFormat("yyyy-MM-dd"));
        return "residentHome/resident_information";
    }

    @RequestMapping(value = "/security.html",method = RequestMethod.GET)
    public String security(Model model){
        User user = (User) session.getAttribute("userBean");
        model.addAttribute("user",user);
        return "residentHome/resident_security";
    }

    @RequestMapping(value = "/order.html",method = RequestMethod.GET)
    public String order(Model model){
        User user = (User) session.getAttribute("userBean");
        model.addAttribute("user",user);
        return "residentHome/resident_order";
    }

    @RequestMapping(value = "/focus.html",method = RequestMethod.GET)
    public String focus(Model model){
        User user = (User) session.getAttribute("userBean");
        model.addAttribute("user",user);
        return "residentHome/resident_focus";
    }

    @RequestMapping(value = "/refund.html",method = RequestMethod.GET)
    public String refund(Model model){
        User user = (User) session.getAttribute("userBean");
        model.addAttribute("user",user);
        return "residentHome/resident_refund";
    }

    @RequestMapping(value = "/updateUser.do",method = RequestMethod.POST)
    public String updateUser(@ModelAttribute("updateUser") UpdateUser updateUser){
        System.out.println(JSON.toJSONString(updateUser,true));
        userService.userMyInfoUpdate(updateUser);
        return "redirect:/userResident/information.html";
    }
}

package xin.yiliya.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import org.apache.http.protocol.HTTP;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import xin.yiliya.pojo.OrderShow;
import xin.yiliya.pojo.UpdateUser;
import xin.yiliya.pojo.User;
import xin.yiliya.service.OrderService;
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

    @Resource
    private OrderService orderService;

    @RequestMapping(value = "/information.html",method = RequestMethod.GET)
    public String information(Model model){
        User user = (User) session.getAttribute("userBean");
        User newUser = userService.getUserInfo(user.getRegistNum());
        model.addAttribute("user",newUser);
        model.addAttribute("updateUser",new UpdateUser());
        model.addAttribute("provinces",regionService.getAllProvinces());
        String provinceId = newUser.getCities().getProvinces().getProvinceId();
        model.addAttribute("cities",regionService.getAllCitiesByProvince(provinceId));
        model.addAttribute("format",new SimpleDateFormat("yyyy-MM-dd"));
        return "residentHome/resident_information";
    }

    @RequestMapping(value = "/security.html",method = RequestMethod.GET)
    public String security(Model model){
        User user = (User) session.getAttribute("userBean");
        User newUser = userService.getUserInfo(user.getRegistNum());
        model.addAttribute("user",newUser);
        model.addAttribute("updateUser",new UpdateUser());
        return "residentHome/resident_security";
    }

    @RequestMapping(value = "/order.html",method = RequestMethod.GET)
    public String order(Model model){
        User user = (User) session.getAttribute("userBean");
        User newUser = userService.getUserInfo(user.getRegistNum());
        Integer userId = user.getUserid();
        int pageSize = 10;
        PageInfo<OrderShow> allOrders = orderService.getAllUserOrder(userId,1,pageSize);
        model.addAttribute("allOrders",allOrders.getList());
        model.addAttribute("allOrderPages",allOrders.getPages());
        PageInfo<OrderShow> dispatchedOrders = orderService.getAllUserSendOrder(userId,1,pageSize);
        model.addAttribute("dispatchedOrders",dispatchedOrders.getList());
        model.addAttribute("dispatchedOrderPages",dispatchedOrders.getPages());
        PageInfo<OrderShow> confirmedOrders = orderService.getAllUserSureOrder(userId,1,pageSize);
        model.addAttribute("confirmedOrders",confirmedOrders.getList());
        model.addAttribute("confirmedOrderPages",confirmedOrders.getPages());
        PageInfo<OrderShow> remarkedOrders = orderService.getAllUserAssessOrder(userId,1,pageSize);
        model.addAttribute("remarkedOrders",remarkedOrders.getList());
        model.addAttribute("remarkedOrderPages",remarkedOrders.getPages());
        model.addAttribute("user",newUser);
        model.addAttribute("updateUser",new UpdateUser());
        model.addAttribute("pageSize",pageSize);
        return "residentHome/resident_order";
    }

    @RequestMapping(value = "/focus.html",method = RequestMethod.GET)
    public String focus(Model model){
        User user = (User) session.getAttribute("userBean");
        User newUser = userService.getUserInfo(user.getRegistNum());

        model.addAttribute("user",newUser);
        model.addAttribute("updateUser",new UpdateUser());
        return "residentHome/resident_focus";
    }

    @RequestMapping(value = "/refund.html",method = RequestMethod.GET)
    public String refund(Model model){
        User user = (User) session.getAttribute("userBean");
        User newUser = userService.getUserInfo(user.getRegistNum());
        model.addAttribute("user",newUser);
        model.addAttribute("updateUser",new UpdateUser());
        return "residentHome/resident_refund";
    }

    @RequestMapping(value = "/updateUser.do",method = RequestMethod.POST)
    public String updateUser(@ModelAttribute("updateUser") UpdateUser updateUser){
        userService.userMyInfoUpdate(updateUser);
        return "redirect:/userResident/information.html";
    }

    @RequestMapping(value = "/updateSecurity.do",method = RequestMethod.POST)
    public String updateSecurity(@ModelAttribute("updateUser") UpdateUser updateUser){
        User user = (User) session.getAttribute("userBean");
        updateUser.setRegistNum(user.getRegistNum());
        userService.userMyInfoUpdate(updateUser);
        return "redirect:/userResident/security.html";
    }
    @RequestMapping(value = "/updatePassword.do",method = RequestMethod.POST)
    public String updatePassword(@ModelAttribute("updateUser") UpdateUser updateUser){
        User user = (User) session.getAttribute("userBean");
        updateUser.setRegistNum(user.getRegistNum());
        userService.userMyInfoUpdate(updateUser);
        session.invalidate();
        return "redirect:/login/user.html";
    }
    @RequestMapping(value = "/updateHeadImg.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean updateHeadImg(UpdateUser updateUser){
        User user = (User) session.getAttribute("userBean");
        updateUser.setRegistNum(user.getRegistNum());
        return userService.userMyInfoUpdate(updateUser);
    }

    @RequestMapping(value = "/getOrders.do",method = RequestMethod.POST)
    @ResponseBody
    public PageInfo<OrderShow> getOrders(Integer currentPage, Integer schema){
        User user = (User) session.getAttribute("userBean");
        Integer userId = user.getUserid();
        int pageSize = 10;
        PageInfo<OrderShow> pageInfo;
        switch (schema){
            default:
                pageInfo = orderService.getAllUserOrder(userId,currentPage,pageSize);
                break;
            case 0:
                pageInfo = orderService.getAllUserOrder(userId,currentPage,pageSize);
                break;
            case 1:
                pageInfo = orderService.getAllUserSendOrder(userId,currentPage,pageSize);
                break;
            case 2:
                pageInfo = orderService.getAllUserSureOrder(userId,currentPage,pageSize);
                break;
            case 3:
                pageInfo = orderService.getAllUserAssessOrder(userId,currentPage,pageSize);
                break;
        }
        return pageInfo;
    }
}

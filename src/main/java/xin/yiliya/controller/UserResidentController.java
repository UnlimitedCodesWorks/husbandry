package xin.yiliya.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import org.apache.http.protocol.HTTP;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import xin.yiliya.pojo.*;
import xin.yiliya.service.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.List;

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

    @Resource
    private UserConcernService userConcernService;

    @Resource
    private FeedbackService feedbackService;

    @RequestMapping(value = "/information/{userId}",method = RequestMethod.GET)
    public String information(@PathVariable("userId") Integer hrefUserId,Model model){
        User user = (User) session.getAttribute("userBean");
        Integer userId = user.getUserid();
        User newUser = userService.getUserInfo(hrefUserId);
        Boolean ifCommon;
        ifCommon = hrefUserId.equals(userId);
        model.addAttribute("ifCommon",ifCommon);
        if(ifCommon){
            model.addAttribute("oldUser",newUser);
            model.addAttribute("user",newUser);
        }else {
            model.addAttribute("oldUser",userService.getUserInfo(userId));
            model.addAttribute("user",newUser);
        }
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
        User newUser = userService.getUserInfo(user.getUserid());
        model.addAttribute("user",newUser);
        model.addAttribute("updateUser",new UpdateUser());
        return "residentHome/resident_security";
    }

    @RequestMapping(value = "/order.html",method = RequestMethod.GET)
    public String order(Model model){
        User user = (User) session.getAttribute("userBean");
        User newUser = userService.getUserInfo(user.getUserid());
        Integer userId = user.getUserid();
        int pageSize = 10;
        PageInfo<OrderShow> allOrders = orderService.getAllUserOrder(userId,1,pageSize);
        model.addAttribute("allOrders",allOrders.getList());
        model.addAttribute("allOrderPages",allOrders.getPages());
        PageInfo<OrderShow> dispatchedOrders = orderService.getAllUserSendOrder(userId,1,pageSize);
        model.addAttribute("dispatchedOrders",dispatchedOrders.getList());
        model.addAttribute("dispatchedOrderPages",dispatchedOrders.getPages());
        model.addAttribute("dispatchedOrderNum",dispatchedOrders.getEndRow());
        PageInfo<OrderShow> confirmedOrders = orderService.getAllUserSureOrder(userId,1,pageSize);
        model.addAttribute("confirmedOrders",confirmedOrders.getList());
        model.addAttribute("confirmedOrderPages",confirmedOrders.getPages());
        model.addAttribute("confirmedOrderNum",confirmedOrders.getEndRow());
        PageInfo<OrderShow> remarkedOrders = orderService.getAllUserAssessOrder(userId,1,pageSize);
        model.addAttribute("remarkedOrders",remarkedOrders.getList());
        model.addAttribute("remarkedOrderPages",remarkedOrders.getPages());
        model.addAttribute("remarkedOrderNum",remarkedOrders.getEndRow());
        model.addAttribute("user",newUser);
        model.addAttribute("updateUser",new UpdateUser());
        model.addAttribute("pageSize",pageSize);
        return "residentHome/resident_order";
    }

    @RequestMapping(value = "/focus/{userId}",method = RequestMethod.GET)
    public String focus(@PathVariable("userId") Integer hrefUserId,Model model){
        User user = (User) session.getAttribute("userBean");
        Integer userId = user.getUserid();
        User newUser = userService.getUserInfo(hrefUserId);
        Boolean ifCommon;
        ifCommon = hrefUserId.equals(userId);
        model.addAttribute("ifCommon",ifCommon);
        if(ifCommon){
            model.addAttribute("oldUser",newUser);
            model.addAttribute("user",newUser);
        }else {
            model.addAttribute("oldUser",userService.getUserInfo(userId));
            model.addAttribute("user",newUser);
        }
        int pageSize =12;
        PageInfo<StoreIndex> concernedStores = userConcernService.userConcernStores(hrefUserId,1,pageSize);
        model.addAttribute("concernedStores",concernedStores.getList());
        model.addAttribute("concernedStorePages",concernedStores.getPages());
        PageInfo<OfferServiceSimple> concernedServices = userConcernService.userConcernServices(hrefUserId,1,pageSize);
        model.addAttribute("concernedServices",concernedServices.getList());
        model.addAttribute("concernedServicePages",concernedServices.getPages());
        model.addAttribute("pageSize",pageSize);
        model.addAttribute("updateUser",new UpdateUser());
        return "residentHome/resident_focus";
    }

    @RequestMapping(value = "/refund.html",method = RequestMethod.GET)
    public String refund(Model model){
        User user = (User) session.getAttribute("userBean");
        User newUser = userService.getUserInfo(user.getUserid());
        Integer userId = user.getUserid();
        int pageSize = 10;
        PageInfo<OrderCancel> orderCancels = orderService.getAllUserCancelOrder(userId,1,pageSize);
        model.addAttribute("orderCancels",orderCancels.getList());
        model.addAttribute("orderCancelPages",orderCancels.getPages());
        model.addAttribute("pageSize",pageSize);
        model.addAttribute("user",newUser);
        model.addAttribute("updateUser",new UpdateUser());
        return "residentHome/resident_refund";
    }

    @RequestMapping(value = "/message.html",method = RequestMethod.GET)
    public String message(Model model){
        User user = (User) session.getAttribute("userBean");
        User newUser = userService.getUserInfo(user.getUserid());
        Integer userId = user.getUserid();
        int pageSize = 10;
        PageInfo<FeedbackSimple> feedbackSimplePageInfo = feedbackService.getAllFeedbackByUserId(userId,1,pageSize);
        model.addAttribute("user",newUser);
        model.addAttribute("feedbacks",feedbackSimplePageInfo.getList());
        model.addAttribute("feedbackPages",feedbackSimplePageInfo.getPages());
        model.addAttribute("pageSize",pageSize);
        return "residentHome/resident_message";
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
    @RequestMapping(value = "/getOrderCancel.do",method = RequestMethod.POST)
    @ResponseBody
    public List<OrderCancel> getOrderCancel(Integer currentPage){
        User user = (User) session.getAttribute("userBean");
        int pageSize = 10;
        Integer userId = user.getUserid();
        return orderService.getAllUserCancelOrder(userId,currentPage,pageSize).getList();
    }
    @RequestMapping(value = "/deleteOrder.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean deleteOrder(Integer orderId){
        return orderService.userDeleteOrder(orderId);
    }

    @RequestMapping(value = "/cancelOrder.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean cancelOrder(Cancel cancel){
        return orderService.userCancelToOrder(cancel);
    }

    @RequestMapping(value = "/getOrderServicePeople.do",method = RequestMethod.POST)
    @ResponseBody
    public List<ServicePeople> getOrderServicePeople(Integer orderId){
        return orderService.getOrderServicePeople(orderId,1,0).getList();
    }

    @RequestMapping(value = "/confirmOrder.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean confirmOrder(Integer orderId){
        return orderService.userSureToOrder(orderId);
    }

    @RequestMapping(value = "/getConcernStore.do",method = RequestMethod.POST)
    @ResponseBody
    public List<StoreIndex> getConcernStore(Integer currentPage){
        User user = (User) session.getAttribute("userBean");
        int pageSize = 12;
        return userConcernService.userConcernStores(user.getUserid(),currentPage,pageSize).getList();
    }

    @RequestMapping(value = "/getConcernService.do",method = RequestMethod.POST)
    @ResponseBody
    public List<OfferServiceSimple> getConcernService(Integer currentPage){
        User user = (User) session.getAttribute("userBean");
        int pageSize = 12;
        return userConcernService.userConcernServices(user.getUserid(),currentPage,pageSize).getList();
    }

    @RequestMapping(value = "/getCancelReason.do",method = RequestMethod.POST)
    @ResponseBody
    public String getCancelReason(Integer cancelId){
        return orderService.getCancelReason(cancelId);
    }

    @RequestMapping(value = "getAllFeedbackByUserId.do",method = RequestMethod.POST)
    @ResponseBody
    public List<FeedbackSimple> getAllFeedbackByUserId(Integer currentPage,Integer userId){
        int pageSize = 10;
        return feedbackService.getAllFeedbackByUserId(userId,currentPage,pageSize).getList();
    }

    @RequestMapping(value = "deleteFeedbacks.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean deleteNews(@RequestParam(value = "feedbackIds[]") Integer[] feedbackIds){
        Boolean b = false;
        for(Integer feedbackId : feedbackIds){
            b = feedbackService.deleteFeedbackById(feedbackId);
            if(!b){
                break;
            }
        }
        return b;
    }

}

package xin.yiliya.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import xin.yiliya.pojo.OfferServiceDetail;
import xin.yiliya.pojo.User;
import xin.yiliya.service.OfferServiceService;
import xin.yiliya.service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/service",method = RequestMethod.GET)
public class ServiceController {

    @Resource
    private UserService userService;

    @Resource
    private HttpSession session;

    @Resource
    private OfferServiceService offerServiceService;

    @RequestMapping(value = "/detail/{serviceId}",method = RequestMethod.GET)
    public String detail(@PathVariable("serviceId") Integer serviceId, Model model){
        User user = (User) session.getAttribute("userBean");
        User newUser = userService.getUserInfo(user.getRegistNum());
        OfferServiceDetail serviceDetail = offerServiceService.getOfferServiceDetailByServiceId(serviceId);
        if(serviceDetail!=null){
            model.addAttribute("service",serviceDetail);
        }else {
            return "redirect:/index.html";
        }
        model.addAttribute("user",newUser);
        return "serviceShow";
    }
}

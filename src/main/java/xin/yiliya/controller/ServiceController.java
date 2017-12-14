package xin.yiliya.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import xin.yiliya.pojo.EvaluateService;
import xin.yiliya.pojo.OfferServiceDetail;
import xin.yiliya.pojo.User;
import xin.yiliya.service.OfferServiceService;
import xin.yiliya.service.ServiceEvaluateService;
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

    @Resource
    private ServiceEvaluateService serviceEvaluateService;

    @RequestMapping(value = "/detail/{serviceId}",method = RequestMethod.GET)
    public String detail(@PathVariable("serviceId") Integer serviceId, Model model){
        User user = (User) session.getAttribute("userBean");
        User newUser = userService.getUserInfo(user.getUserid());
        OfferServiceDetail serviceDetail = offerServiceService.getOfferServiceDetailByServiceId(serviceId);
        if(serviceDetail!=null){
            model.addAttribute("service",serviceDetail);
        }else {
            return "redirect:/index.html";
        }
        int pageSize = 1;
        int sonPageSize = 1;
        PageInfo<EvaluateService> evaluates =
                serviceEvaluateService.getAllEvaluateByServiceId(serviceId,true,1,pageSize,sonPageSize);
        model.addAttribute("evaluates",evaluates.getList());
        model.addAttribute("evaluatePages",evaluates.getPages());
        model.addAttribute("pageSize",pageSize);
        model.addAttribute("sonPageSize",sonPageSize);
        model.addAttribute("user",newUser);
        return "serviceShow";
    }
}

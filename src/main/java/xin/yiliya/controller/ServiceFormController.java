package xin.yiliya.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import xin.yiliya.pojo.User;
import xin.yiliya.service.OrderFormService;
import xin.yiliya.service.ServiceService;
import xin.yiliya.service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/serviceForm",method = RequestMethod.GET)
public class ServiceFormController {

    @Resource
    private OrderFormService orderFormService;

    @Resource
    private ServiceService serviceService;

    @Resource
    private HttpSession session;

    @Resource
    private UserService userService;

    @RequestMapping(value = "/view.html",method = RequestMethod.GET)
    public String serviceFormView(@RequestParam(value = "kind")Integer kind,
                                   @RequestParam(value = "serviceId")Integer serviceId,
                                  Model model){
        User user = (User) session.getAttribute("userBean");
        User newUser = userService.getUserInfo(user.getUserid());
        model.addAttribute("user",newUser);
        model.addAttribute("serviceForm",orderFormService.getAllOrderFormRow(kind));
        model.addAttribute("serviceName",serviceService.getSerKindBySerId(kind));
        model.addAttribute("serviceId",serviceId);
        return "service_form";
    }
}

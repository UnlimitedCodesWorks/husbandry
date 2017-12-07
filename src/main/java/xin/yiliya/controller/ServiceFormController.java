package xin.yiliya.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import xin.yiliya.service.OrderFormService;
import xin.yiliya.service.ServiceService;

import javax.annotation.Resource;

@Controller
@RequestMapping(value = "/serviceForm",method = RequestMethod.GET)
public class ServiceFormController {

    @Resource
    private OrderFormService orderFormService;

    @Resource
    private ServiceService serviceService;

    @RequestMapping(value = "/view.html",method = RequestMethod.GET)
    public String serviceFormView(@RequestParam(value = "kind")Integer kind,
                                   @RequestParam(value = "serviceId")Integer serviceId,
                                  Model model){
        model.addAttribute("serviceForm",orderFormService.getAllOrderFormRow(kind));
        model.addAttribute("serviceName",serviceService.getSerKindBySerId(kind));
        model.addAttribute("serviceId",serviceId);
        return "service_form";
    }
}

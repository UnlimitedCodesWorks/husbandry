package xin.yiliya.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import xin.yiliya.pojo.*;
import xin.yiliya.service.OrderService;
import xin.yiliya.service.ServicePeopleService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/storeAdmin",method = RequestMethod.GET)
public class StoreSureController extends BaseController{

    @Resource
    HttpSession httpSession;

    @Resource
    OrderService orderService;

    @Resource
    ServicePeopleService servicePeopleService;

    @RequestMapping(value = "/storeSure.html",method = RequestMethod.GET)
    public String storeSureHTML(Model model){
        Store store = (Store) httpSession.getAttribute("storeBean");
        Integer storeId=store.getStoreid();
        model.addAttribute("storeId",storeId);
        model.addAttribute("sureOrderList",orderService.getAllStoreSureOrder(storeId,1,2).getList());
        model.addAttribute("pages",orderService.getAllStoreSureOrder(storeId,1,2).getPages());
        model.addAttribute("input","none");
        model.addAttribute("type","none");
        model.addAttribute("peopleTemplateList",servicePeopleService.getAllServicePeopleTemplateByStoreId(storeId,1,3).getList());
        model.addAttribute("templatePages",servicePeopleService.getAllServicePeopleTemplateByStoreId(storeId,1,3).getPages());
        model.addAttribute("servicePeopleUpdate",new ServicePeopleUpdate());
        model.addAttribute("servicePeopleTemp",new ServicePeopleTemp());
        return "/storeAdmin/order_wait_confirm";
    }

    @RequestMapping(value = "/storeSure.do",method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<OrderSimple> storeSurePage(@RequestParam(value = "input",required = false)String input,
                                               @RequestParam(value = "type",required = false)String type,
                                               @RequestParam(value = "currentPage")Integer currentPage,
                                               @RequestParam(value = "storeId")Integer storeId){
        if(input==null&&type==null){
            return orderService.getAllStoreSureOrder(storeId,currentPage,2);
        }
        else{
            return orderService.getAllStoreSureOrder(input.trim(),type,storeId,currentPage,2);
        }
    }

    @RequestMapping(value = "/sureSearch.do",method = RequestMethod.POST)
    public String searchSureDo(String input,String orderType,Model model){
        Store store = (Store) httpSession.getAttribute("storeBean");
        Integer storeId=store.getStoreid();
        model.addAttribute("storeId",storeId);
        model.addAttribute("sureOrderList",orderService.getAllStoreSureOrder(input.trim(),orderType,storeId,1,2).getList());
        model.addAttribute("pages",orderService.getAllStoreSureOrder(input.trim(),orderType,storeId,1,2).getPages());
        model.addAttribute("input",input.trim());
        model.addAttribute("type",orderType);
        model.addAttribute("peopleTemplateList",servicePeopleService.getAllServicePeopleTemplateByStoreId(storeId,1,3).getList());
        model.addAttribute("templatePages",servicePeopleService.getAllServicePeopleTemplateByStoreId(storeId,1,3).getPages());
        model.addAttribute("servicePeopleUpdate",new ServicePeopleUpdate());
        model.addAttribute("servicePeopleTemp",new ServicePeopleTemp());
        return "/storeAdmin/order_wait_confirm";
    }

    @RequestMapping(value = "/lookDisPatchPeople.do",method = RequestMethod.POST)
    @ResponseBody
    public ServicePeople lookDisPatchPeopleDo(Integer orderId){
        return servicePeopleService.getDispatchPeople(orderId);
    }

    @RequestMapping(value = "/upDispatcher.do",method = RequestMethod.POST)
    public String updateDispatchDo(@ModelAttribute("servicePeopleUpdate")ServicePeopleUpdate servicePeopleUpdate){
        Boolean b=servicePeopleService.updateServicePeopleTemlate(servicePeopleUpdate);
        return "redirect:/storeAdmin/storeSure.html";
    }

    @RequestMapping(value = "/upDispatchTemplate.do",method = RequestMethod.POST)
    public String upDispatchTemplateDo(@ModelAttribute("servicePeopleTemp")ServicePeopleTemp servicePeopleTemp){
        servicePeopleService.addRestartDispatchTemplate(servicePeopleTemp);
        return "redirect:/storeAdmin/storeSure.html";
    }

}

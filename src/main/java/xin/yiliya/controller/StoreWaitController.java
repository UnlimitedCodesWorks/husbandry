package xin.yiliya.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import xin.yiliya.pojo.OrderSimple;
import xin.yiliya.pojo.ServicePeople;
import xin.yiliya.pojo.ServicePeopleTemp;
import xin.yiliya.pojo.Store;
import xin.yiliya.service.OrderService;
import xin.yiliya.service.ServicePeopleService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/storeAdmin",method = RequestMethod.GET)
public class StoreWaitController extends BaseController{

    @Resource
    HttpSession httpSession;

    @Resource
    OrderService orderService;

    @Resource
    ServicePeopleService servicePeopleService;

    @RequestMapping(value = "/storeWait.html",method = RequestMethod.GET)
    public String storeWaitHTML(Model model){
        Store store = (Store) httpSession.getAttribute("storeBean");
        Integer storeId=store.getStoreid();
        model.addAttribute("storeId",storeId);
        model.addAttribute("waitOrderList",orderService.getAllStoreHandleOrder(storeId,1,2).getList());
        model.addAttribute("pages",orderService.getAllStoreHandleOrder(storeId,1,2).getPages());
        model.addAttribute("input","none");
        model.addAttribute("type","none");
        model.addAttribute("servicePeopleTemp",new ServicePeopleTemp());
        model.addAttribute("peopleTemplateList",servicePeopleService.getAllServicePeopleTemplateByStoreId(storeId,1,3).getList());
        model.addAttribute("templatePages",servicePeopleService.getAllServicePeopleTemplateByStoreId(storeId,1,3).getPages());
        return "/storeAdmin/order_wait_handle";
    }

    @RequestMapping(value = "/storeWait.do",method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<OrderSimple> storeWaitPage(@RequestParam(value = "input",required = false)String input,
                                               @RequestParam(value = "type",required = false)String type,
                                               @RequestParam(value = "currentPage")Integer currentPage,
                                               @RequestParam(value = "storeId")Integer storeId){
        if(input==null&&type==null){
            return orderService.getAllStoreHandleOrder(storeId,currentPage,2);
        }
        else{
            return orderService.getAllStoreHandleOrder(input.trim(),type,storeId,currentPage,2);
        }
    }

    @RequestMapping(value = "/waitSearch.do",method = RequestMethod.POST)
    public String searchWaitDo(String input,String orderType,Model model){
        Store store = (Store) httpSession.getAttribute("storeBean");
        Integer storeId=store.getStoreid();
        model.addAttribute("storeId",storeId);
        model.addAttribute("waitOrderList",orderService.getAllStoreHandleOrder(input.trim(),orderType,storeId,1,2).getList());
        model.addAttribute("pages",orderService.getAllStoreHandleOrder(input.trim(),orderType,storeId,1,2).getPages());
        model.addAttribute("input",input.trim());
        model.addAttribute("type",orderType);
        model.addAttribute("servicePeopleTemp",new ServicePeopleTemp());
        model.addAttribute("peopleTemplateList",servicePeopleService.getAllServicePeopleTemplateByStoreId(storeId,1,3).getList());
        model.addAttribute("templatePages",servicePeopleService.getAllServicePeopleTemplateByStoreId(storeId,1,3).getPages());
        return "/storeAdmin/order_wait_handle";
    }

    @RequestMapping(value = "/waitDispatch.do",method = RequestMethod.POST)
    public String dispatchDo(@ModelAttribute("servicePeopleTemp") ServicePeopleTemp servicePeopleTemp){
        Store store = (Store) httpSession.getAttribute("storeBean");
        Integer storeId=store.getStoreid();
        servicePeopleTemp.setStoreId(storeId);
        servicePeopleService.addTempServicePeople(servicePeopleTemp,false);
        return "redirect:/storeAdmin/storeWait.html";
    }

    @RequestMapping(value = "/muBan.do",method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<ServicePeople> peoplePagePage(@RequestParam(value = "currentPage")Integer currentPage,
                                                  @RequestParam(value = "storeId")Integer storeId){

        return servicePeopleService.getAllServicePeopleTemplateByStoreId(storeId,currentPage,3);

    }

    @RequestMapping(value = "/chooseServicePeople.do",method = RequestMethod.POST)
    @ResponseBody
    public ServicePeople getTemplatePeopleDo(Integer servicePeopleId){
        return servicePeopleService.getServicePeopleTemplateById(servicePeopleId);
    }

    @RequestMapping(value = "/waitDispatchTemplate.do",method = RequestMethod.POST)
    public String dispatchTemplateDo(@ModelAttribute("servicePeopleTemp") ServicePeopleTemp servicePeopleTemp){
        servicePeopleService.addTempServicePeople(servicePeopleTemp,true);
        return "redirect:/storeAdmin/storeWait.html";
    }

}

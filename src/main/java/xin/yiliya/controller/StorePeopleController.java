package xin.yiliya.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import xin.yiliya.pojo.ServicePeople;
import xin.yiliya.pojo.ServicePeopleAdd;
import xin.yiliya.pojo.ServicePeopleUpdate;
import xin.yiliya.pojo.Store;
import xin.yiliya.service.ServicePeopleService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/storeAdmin",method = RequestMethod.GET)
public class StorePeopleController extends BaseController{

    @Resource
    HttpSession httpSession;

    @Resource
    ServicePeopleService servicePeopleService;

    @RequestMapping(value = "/storePeople.html",method = RequestMethod.GET)
    public String storePeopleHTML(Model model){
        Store store = (Store) httpSession.getAttribute("storeBean");
        Integer storeId=store.getStoreid();
        model.addAttribute("storeId",storeId);
        model.addAttribute("servicePeopleList",servicePeopleService.getAllServicePeopleTemplateByStoreId(storeId,1,2).getList());
        model.addAttribute("pages",servicePeopleService.getAllServicePeopleTemplateByStoreId(storeId,1,2).getPages());
        model.addAttribute("servicePeopleAdd",new ServicePeopleAdd());
        model.addAttribute("servicePeopleUpdate",new ServicePeopleUpdate());
        return "/storeAdmin/service_staff";
    }

    @RequestMapping(value = "/storePeople.do",method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<ServicePeople> storePeoplePage(@RequestParam(value = "currentPage")Integer currentPage,
                                                   @RequestParam(value = "storeId")Integer storeId){
        return servicePeopleService.getAllServicePeopleTemplateByStoreId(storeId,currentPage,2);
    }

    @RequestMapping(value = "/delete.do",method = RequestMethod.GET)
    public String deleteTemplateDo(@RequestParam(value = "servicePeopleId")String servicePeopleId){
        String[] ids=servicePeopleId.split("[^0123456789.]+");
        for(String s:ids){
            servicePeopleService.deleteServicePeopleTemplate(Integer.parseInt(s));
        }
        return "redirect:storePeople.html";
    }

    @RequestMapping(value = "/createPeople.do",method = RequestMethod.POST)
    public String createPeopleDo(@ModelAttribute("servicePeopleAdd") ServicePeopleAdd servicePeopleAdd){
        Store store = (Store) httpSession.getAttribute("storeBean");
        Integer storeId=store.getStoreid();
        servicePeopleAdd.setStoreId(storeId);
        servicePeopleService.addServicePeopleTemplate(servicePeopleAdd);
        return "redirect:/storeAdmin/storePeople.html";
    }

    @RequestMapping(value = "/lookServicePeople.do",method = RequestMethod.POST)
    @ResponseBody
    public ServicePeople getServicePeopleDo(Integer servicePeopleId){
        return servicePeopleService.getServicePeopleTemplateById(servicePeopleId);
    }

    @RequestMapping(value = "/updatePeople.do",method = RequestMethod.POST)
    public String updatePeopleDo(@ModelAttribute("servicePeopleUpdate") ServicePeopleUpdate servicePeopleUpdate){
        servicePeopleService.updateServicePeopleTemlate(servicePeopleUpdate);
        return "redirect:/storeAdmin/storePeople.html";
    }

}

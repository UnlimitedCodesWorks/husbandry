package xin.yiliya.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.yiliya.pojo.ServicePeople;
import xin.yiliya.pojo.ServicePeopleAdd;
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

}

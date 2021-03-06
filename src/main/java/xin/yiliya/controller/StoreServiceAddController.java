package xin.yiliya.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.yiliya.pojo.OfferServiceAdd;
import xin.yiliya.pojo.OfferServiceDetail;
import xin.yiliya.pojo.OfferServiceTemplate;
import xin.yiliya.pojo.Store;
import xin.yiliya.service.OfferServiceService;
import xin.yiliya.service.RegionService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/storeAdmin",method = RequestMethod.GET)
public class StoreServiceAddController {

    @Resource
    private HttpSession session;

    @Resource
    private OfferServiceService offerServiceService;

    @Resource
    private RegionService regionService;

    @RequestMapping(value = "/serviceAdd.html",method = RequestMethod.GET)
    public String serviceAdd(Model model){
        Store store = (Store) session.getAttribute("storeBean");
        Integer storeId = store.getStoreid();
        int pageSize = 7;
        PageInfo<OfferServiceTemplate> offerServiceTemplatePageInfo = offerServiceService.getAllOfferServiceTemplateByStoreId(storeId,1,pageSize);
        model.addAttribute("serviceTemplates",offerServiceTemplatePageInfo.getList());
        model.addAttribute("serviceTemplatePages",offerServiceTemplatePageInfo.getPages());
        model.addAttribute("pageSize",pageSize);
        model.addAttribute("provinces",regionService.getAllProvinces());
        model.addAttribute("cities",regionService.getAllCitiesByProvince("340000"));
        return "storeAdmin/add_service";
    }

    @RequestMapping(value = "/addService.do",method = RequestMethod.POST)
    @ResponseBody
    public Integer addService(OfferServiceAdd offerServiceAdd){
        return offerServiceService.addService(offerServiceAdd,false);
    }

    @RequestMapping(value = "/getTOfferServiceDetailByServiceId.do",method = RequestMethod.POST)
    @ResponseBody
    public OfferServiceDetail getTOfferServiceDetailByServiceId(Integer serviceId){
        return offerServiceService.getTOfferServiceDetailByServiceId(serviceId);
    }


}

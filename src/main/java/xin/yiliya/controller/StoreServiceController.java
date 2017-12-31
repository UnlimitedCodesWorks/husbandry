package xin.yiliya.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.yiliya.pojo.OfferServiceDetail;
import xin.yiliya.pojo.OfferServiceSimple;
import xin.yiliya.pojo.OfferServiceUpdate;
import xin.yiliya.pojo.Store;
import xin.yiliya.service.OfferServiceService;
import xin.yiliya.service.RegionService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/storeAdmin",method = RequestMethod.GET)
public class StoreServiceController {

    @Resource
    private HttpSession session;

    @Resource
    private OfferServiceService offerServiceService;

    @Resource
    private RegionService regionService;

    @RequestMapping(value = "/service.html",method = RequestMethod.GET)
    public String service(Model model){
        Store store = (Store) session.getAttribute("storeBean");
        Integer storeId = store.getStoreid();
        int pageSize = 10;
        PageInfo<OfferServiceSimple> offerServiceSimplePageInfo = offerServiceService.getSAllSimpleOfferServiceByStoreId(storeId,1,pageSize);
        model.addAttribute("services",offerServiceSimplePageInfo.getList());
        model.addAttribute("servicePages",offerServiceSimplePageInfo.getPages());
        model.addAttribute("pageSize",pageSize);
        model.addAttribute("provinces",regionService.getAllProvinces());
        model.addAttribute("cities",regionService.getAllCitiesByProvince("340000"));
        return "storeAdmin/store_service";
    }

    @RequestMapping(value = "/getSAllSimpleOfferServiceByStoreId.do",method = RequestMethod.POST)
    @ResponseBody
    public List<OfferServiceSimple> getSAllSimpleOfferServiceByStoreId(Integer storeId, Integer currentPage){
        int pageSize = 10;
        return offerServiceService.getSAllSimpleOfferServiceByStoreId(storeId,currentPage,pageSize).getList();
    }

    @RequestMapping(value = "/getSOfferServiceDetailByServiceId.do",method = RequestMethod.POST)
    @ResponseBody
    public OfferServiceDetail getSOfferServiceDetailByServiceId(Integer serviceId){
        return offerServiceService.getSOfferServiceDetailByServiceId(serviceId);
    }

    @RequestMapping(value = "/updateService.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean updateService(OfferServiceUpdate offerServiceupdate){
        return offerServiceService.updateService(offerServiceupdate,false);
    }

    @RequestMapping(value = "/deleteService.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean deleteService(@RequestParam(value = "serviceIds[]") Integer[] serviceIds){
        Boolean b = false;
        for(Integer serviceId : serviceIds){
            b = offerServiceService.deleteService(serviceId);
            if(!b){
                break;
            }
        }
        return b;
    }
}

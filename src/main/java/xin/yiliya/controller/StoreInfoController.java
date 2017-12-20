package xin.yiliya.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.yiliya.pojo.Store;
import xin.yiliya.pojo.UpdateStore;
import xin.yiliya.service.RegionService;
import xin.yiliya.service.StoreService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping(value = "/storeAdmin",method = RequestMethod.GET)
public class StoreInfoController {

    @Resource
    private HttpSession session;

    @Resource
    private StoreService storeService;

    @Resource
    private RegionService regionService;

    @RequestMapping(value = "/information.html",method = RequestMethod.GET)
    public String information(Model model){
        Store store = (Store) session.getAttribute("storeBean");
        Store storeDetail = storeService.getStoreInfo(store.getStoreid());
        String provinceId = storeDetail.getAreas().getCity().getProvinces().getProvinceId();
        String cityId = storeDetail.getAreas().getCity().getCityId();
        model.addAttribute("storeDetail",storeDetail);
        model.addAttribute("updateStore",new UpdateStore());
        Map<String,String> provinces = regionService.getAllProvinces();
        model.addAttribute("provinces",provinces);
        model.addAttribute("cities",regionService.getAllCitiesByProvince(provinceId));
        model.addAttribute("areas",regionService.getAllAreasByCity(cityId));
        return "storeAdmin/store_information";
    }

    @RequestMapping(value = "/updateInfo.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean updateInfo(UpdateStore updateStore){
        return storeService.update(updateStore);
    }
}

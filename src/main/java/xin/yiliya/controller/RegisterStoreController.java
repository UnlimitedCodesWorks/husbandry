package xin.yiliya.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.yiliya.pojo.Areas;
import xin.yiliya.pojo.Cities;
import xin.yiliya.pojo.RegisterStore;
import xin.yiliya.service.RegionService;
import xin.yiliya.service.StoreService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/store",method = RequestMethod.GET)
public class RegisterStoreController {

    @Resource
    private RegionService regionService;

    @Resource
    private StoreService storeService;

    @RequestMapping(value = "/register.html",method = RequestMethod.GET)
    public String store(Model model){
        Map<String,String> provinces = regionService.getAllProvinces();
        model.addAttribute("provinces",provinces);
        model.addAttribute("registerStore",new RegisterStore());
        return "register_store";
    }

    @RequestMapping(value = "/getCitys.do",method = RequestMethod.POST)
    @ResponseBody
    public List<Cities> getCitys(String provinceId){
        return regionService.getAllCitiesByProvince(provinceId);
    }

    @RequestMapping(value = "/getAreas.do",method = RequestMethod.POST)
    @ResponseBody
    public  List<Areas> getAreas(String cityId){
        return regionService.getAllAreasByCity(cityId);
    }

    @RequestMapping(value = "/register.do",method = RequestMethod.POST)
    public String register(@ModelAttribute("registerStore") RegisterStore store){
        Integer b = storeService.register(store);
        return "redirect:/index.html";
    }
}

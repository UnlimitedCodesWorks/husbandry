package xin.yiliya.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.yiliya.pojo.RegisterStore;
import xin.yiliya.service.AdminService;
import xin.yiliya.service.RegionService;
import xin.yiliya.service.StoreService;

import javax.annotation.Resource;
import java.util.HashMap;
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
        Map<String,String> provinces = new HashMap<String, String>(regionService.getAllProvinces());
        model.addAttribute("provinces",provinces);
        model.addAttribute("registerStore",new RegisterStore());
        return "register_store";
    }

    @RequestMapping(value = "/register.do",method = RequestMethod.POST)
    @ResponseBody
    public Integer register(RegisterStore store){
        return storeService.register(store);
    }
}

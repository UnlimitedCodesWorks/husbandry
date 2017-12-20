package xin.yiliya.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import xin.yiliya.pojo.OfferServiceSimple;
import xin.yiliya.pojo.ServiceEvalutePerMonth;
import xin.yiliya.pojo.Store;
import xin.yiliya.service.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping(value = "/storeAdmin")
public class ServiceScoreController {

    @Resource
    HttpSession httpSession;

    @Resource
    OfferServiceService offerServiceService;

    @Resource
    ServiceEvaluateService serviceEvaluateService;

    @RequestMapping(value = "/serviceScore.html",method = RequestMethod.GET)
    public String serviceScoreHTML(Model model){
        Store store = (Store) httpSession.getAttribute("storeBean");
        model.addAttribute("storeId",store.getStoreid());
        model.addAttribute("serviceList",offerServiceService.getAllSimpleOfferServiceByStoreId(store.getStoreid(),1,2).getList());
        model.addAttribute("pages",offerServiceService.getAllSimpleOfferServiceByStoreId(store.getStoreid(),1,2).getPages());
        return "/storeAdmin/service_score";
    }

    @RequestMapping(value = "/page.do",method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<OfferServiceSimple> serviceScorePage(@RequestParam(value = "storeId")Integer storeId,
                                                         @RequestParam(value = "currentPage")Integer currentPage){
        return offerServiceService.getAllSimpleOfferServiceByStoreId(storeId,currentPage,2);
    }

    @RequestMapping(value = "/line.do",method =RequestMethod.GET)
    @ResponseBody
    public ServiceEvalutePerMonth getLineDo(Integer offserviceId){
        String serviceName=offerServiceService.getOfferServiceDetailByServiceId(offserviceId).getServiceName();
        return serviceEvaluateService.getGradePerMonthBySeviceId(offserviceId,serviceName,new Date());
    }

}

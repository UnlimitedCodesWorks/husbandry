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
@RequestMapping(value = "/storeAdmin/serviceScore",method = RequestMethod.GET)
public class ServiceScoreController {

    @Resource
    HttpSession httpSession;

    @Resource
    StoreService storeService;

    @Resource
    StoreNewsService storeNewsService;

    @Resource
    EvaluateStoreService evaluateStoreService;

    @Resource
    OfferServiceService offerServiceService;

    @Resource
    ServiceEvaluateService serviceEvaluateService;

    @RequestMapping(value = "/{storeId}",method = RequestMethod.GET)
    public String serviceScoreHTML(@PathVariable("storeId") Integer storeId,Model model){
        Store store = (Store) httpSession.getAttribute("storeBean");
        model.addAttribute("storeInfo",storeService.getStoreInfo(storeId));
        model.addAttribute("storeId",storeId);
        model.addAttribute("unReadNews",storeNewsService.getUnreadNumByStoreId(storeId));
        model.addAttribute("score",evaluateStoreService.getGradePerMonthByStoreId(storeId,store.getStoreName(),new Date()));
        model.addAttribute("serviceList",offerServiceService.getAllSimpleOfferServiceByStoreId(storeId,1,2).getList());
        model.addAttribute("pages",offerServiceService.getAllSimpleOfferServiceByStoreId(storeId,1,2).getPages());
        return "/storeAdmin/service_score";
    }

    @RequestMapping(value = "/page.do",method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<OfferServiceSimple> serviceScorePage(@RequestParam(value = "currentPage")Integer currentPage,
                                                         @RequestParam(value = "storeId")Integer storeId){
        return offerServiceService.getAllSimpleOfferServiceByStoreId(storeId,currentPage,2);
    }

    @RequestMapping(value = "/line.do",method =RequestMethod.GET)
    @ResponseBody
    public ServiceEvalutePerMonth getLineDo(Integer offserviceId){
        String serviceName=offerServiceService.getOfferServiceDetailByServiceId(offserviceId).getServiceName();
        return serviceEvaluateService.getGradePerMonthBySeviceId(offserviceId,serviceName,new Date());
    }

}

package xin.yiliya.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import xin.yiliya.pojo.*;
import xin.yiliya.service.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/store",method = RequestMethod.GET)
public class StoreController {

    @Resource
    private HttpSession session;

    @Resource
    private UserService userService;

    @Resource
    private StoreService storeService;

    @Resource
    private OfferServiceService offerServiceService;

    @Resource
    private UserConcernService userConcernService;

    @Resource
    private EvaluateStoreService evaluateStoreService;


    @RequestMapping(value = "/information/{storeId}",method = RequestMethod.GET)
    public String information(@PathVariable("storeId") Integer storeId, Model model){
        User user = (User) session.getAttribute("userBean");
        Store store = (Store) session.getAttribute("storeBean");
        Boolean userLogin = user!=null;
        Boolean storeLogin = store!=null;
        Boolean loginStatus = userLogin||storeLogin;
        model.addAttribute("loginStatus",loginStatus);
        int servicePageSize = 1;
        int evaluatePageSize = 1;
        int sonPageSize = 1;
        if(userLogin){
            model.addAttribute("user",userService.getUserInfo(user.getUserid()));
            ConcernStoreKey concernStoreKey = new ConcernStoreKey();
            concernStoreKey.setStoreId(storeId);
            concernStoreKey.setUserId(user.getUserid());
            model.addAttribute("userConcern",userConcernService.concernStoreJudgement(concernStoreKey));
        }
        if(storeLogin) model.addAttribute("store",storeService.getStoreInfo(store.getStoreid()));
        model.addAttribute("storeInfo",storeService.getInfoByStoreId(storeId));
        PageInfo<OfferServiceSimple> services = offerServiceService.getAllSimpleOfferServiceByStoreId(storeId,1,servicePageSize);
        model.addAttribute("services",services.getList());
        model.addAttribute("servicePages",services.getPages());
        PageInfo<EvaluateStore> evaluates = evaluateStoreService.getAllEvaluateByStoreId(storeId,true,1,evaluatePageSize,sonPageSize);
        model.addAttribute("evaluates",evaluates.getList());
        model.addAttribute("evaluatePages",evaluates.getPages());
        model.addAttribute("servicePageSize",servicePageSize);
        model.addAttribute("evaluatePageSize",evaluatePageSize);
        model.addAttribute("sonPageSize",sonPageSize);
        return "storeHome";
    }
}

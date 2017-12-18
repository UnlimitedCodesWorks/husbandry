package xin.yiliya.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.yiliya.pojo.*;
import xin.yiliya.service.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

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

    @Resource
    private EStoreUserService eStoreUserService;


    @RequestMapping(value = "/information/{storeId}",method = RequestMethod.GET)
    public String information(@PathVariable("storeId") Integer storeId, Model model){
        User user = (User) session.getAttribute("userBean");
        Store store = (Store) session.getAttribute("storeBean");
        Boolean userLogin = user!=null;
        Boolean storeLogin = store!=null;
        Boolean loginStatus = userLogin||storeLogin;
        model.addAttribute("loginStatus",loginStatus);
        int servicePageSize = 12;
        int evaluatePageSize = 12;
        int sonPageSize = 5;
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
        model.addAttribute("storeId",storeId);
        return "storeHome";
    }

    @RequestMapping(value = "/getAllSimpleOfferServiceByStoreId.do",method = RequestMethod.POST)
    @ResponseBody
    public List<OfferServiceSimple> getAllSimpleOfferServiceByStoreId(Integer storeId,Integer currentPage){
        int pageSize = 12;
        return offerServiceService.getAllSimpleOfferServiceByStoreId(storeId,currentPage,pageSize).getList();
    }

    @RequestMapping(value = "/getAllEvaluateByStoreId.do",method = RequestMethod.POST)
    @ResponseBody
    public List<EvaluateStore> getAllEvaluateByStoreId(Integer storeId,Boolean schema,Integer currentPage){
        int pageSize = 12;
        int sonPageSize = 5;
        return evaluateStoreService.getAllEvaluateByStoreId(storeId,true,currentPage,pageSize,sonPageSize).getList();
    }

    @RequestMapping(value = "/getAllEstoreUserByEstoreId.do",method = RequestMethod.POST)
    @ResponseBody
    public List<EstoreUser> getAllEstoreUserByEstoreId(Integer evaluateId,Integer currentPage){
        int pageSize = 12;
        return eStoreUserService.getAllEstoreUserByEstoreId(evaluateId,currentPage,pageSize).getList();
    }

    @RequestMapping(value = "/concernStore.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean concernStore(ConcernStore concernStore){
        return userConcernService.concernStore(concernStore);
    }

    @RequestMapping(value = "/unConcernStore.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean unConcernStore(ConcernStoreKey key){
        return userConcernService.unconcernStore(key);
    }

    @RequestMapping(value = "/support.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean support(Integer evaluateId){
        return evaluateStoreService.support(evaluateId);
    }

    @RequestMapping(value = "/replyEvaluate.do",method = RequestMethod.POST)
    @ResponseBody
    public Integer replyEvaluate(EstoreUser eserviceUser){
        return eStoreUserService.reply(eserviceUser);
    }

    @RequestMapping(value = "/deleteEvaluate.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean deleteEvaluate(Integer evaluateId){
        return evaluateStoreService.deleteEvaluateById(evaluateId);
    }

    @RequestMapping(value = "/deleteReply.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean deleteReply(Integer replyId){
        return eStoreUserService.deleteReplyById(replyId);
    }

    @RequestMapping(value = "/evaluateStore.do",method = RequestMethod.POST)
    @ResponseBody
    public Integer evaluateStore(EvaluateStore evaluateStore){
        return evaluateStoreService.addEvaluate(evaluateStore);
    }
}

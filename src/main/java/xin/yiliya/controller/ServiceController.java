package xin.yiliya.controller;

import com.alibaba.fastjson.JSON;
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
@RequestMapping(value = "/service",method = RequestMethod.GET)
public class ServiceController {

    @Resource
    private UserService userService;

    @Resource
    private HttpSession session;

    @Resource
    private OfferServiceService offerServiceService;

    @Resource
    private ServiceEvaluateService serviceEvaluateService;

    @Resource
    private EserviceUserService eserviceUserService;

    @Resource
    private UserConcernService userConcernService;

    @Resource
    private ComplainService complainService;

    @RequestMapping(value = "/detail/{serviceId}",method = RequestMethod.GET)
    public String detail(@PathVariable("serviceId") Integer serviceId, Model model){
        User user = (User) session.getAttribute("userBean");
        Integer userId = user.getUserid();
        User newUser = userService.getUserInfo(userId);
        offerServiceService.increaseViewNumByServiceId(serviceId);
        OfferServiceDetail serviceDetail = offerServiceService.getOfferServiceDetailByServiceId(serviceId);
        if(serviceDetail!=null){
            model.addAttribute("service",serviceDetail);
        }else {
            return "redirect:/index.html";
        }
        int pageSize = 12;
        int sonPageSize = 5;
        PageInfo<EvaluateService> evaluates =
                serviceEvaluateService.getAllEvaluateByServiceId(serviceId,true,1,pageSize,sonPageSize);
        model.addAttribute("evaluates",evaluates.getList());
        model.addAttribute("evaluatePages",evaluates.getPages());
        model.addAttribute("pageSize",pageSize);
        model.addAttribute("sonPageSize",sonPageSize);
        model.addAttribute("user",newUser);
        ConcernServiceKey concernServiceKey = new ConcernServiceKey();
        concernServiceKey.setServiceId(serviceId);
        concernServiceKey.setUserId(userId);
        model.addAttribute("ifConcern",userConcernService.concernServiceJudgement(concernServiceKey));
        model.addAttribute("ifComment",serviceEvaluateService.ReviewQualification(serviceId,userId));
        model.addAttribute("areaJson",JSON.toJSONString(serviceDetail.getCities(),true));
        return "serviceShow";
    }

    @RequestMapping(value = "/getAllEvaluateByServiceId.do",method = RequestMethod.POST)
    @ResponseBody
    public List<EvaluateService> getAllEvaluateByServiceId(Integer serviceId,Boolean schema,Integer currentPage){
        int pageSize = 12;
        int sonPageSize = 5;
        return serviceEvaluateService.getAllEvaluateByServiceId(serviceId,schema,currentPage,pageSize,sonPageSize).getList();
    }

    @RequestMapping(value = "/getAllReplyByEvaluateId.do",method = RequestMethod.POST)
    @ResponseBody
    public List<EserviceUser> getAllReplyByEvaluateId(Integer evaluateId,Integer currentPage){
        int pageSize = 5;
        return eserviceUserService.getAllReplyByEvaluateId(evaluateId,currentPage,pageSize).getList();
    }

    @RequestMapping(value = "/concernService.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean concernService(ConcernService concernService){
        return userConcernService.concernService(concernService);
    }

    @RequestMapping(value = "/unConcernService.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean unConcernService(ConcernService concernService){
        return userConcernService.unconcernService(concernService);
    }

    @RequestMapping(value = "/complainService.do",method = RequestMethod.POST)
    @ResponseBody
    public Integer complainService(Complain complain){
        return complainService.complainStore(complain);
    }

    @RequestMapping(value = "/evaluateService.do",method = RequestMethod.POST)
    @ResponseBody
    public Integer evaluateService(EvaluateService evaluateService){
        return serviceEvaluateService.addEvaluate(evaluateService);
    }

    @RequestMapping(value = "/replyEvaluate.do",method = RequestMethod.POST)
    @ResponseBody
    public Integer replyEvaluate(EserviceUser eserviceUser){
        return eserviceUserService.reply(eserviceUser);
    }

    @RequestMapping(value = "/deleteEvaluate.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean deleteEvaluate(Integer evaluateId){
        return serviceEvaluateService.deleteEvaluateById(evaluateId);
    }

    @RequestMapping(value = "/deleteReply.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean deleteReply(Integer replyId){
        return eserviceUserService.deleteReplyById(replyId);
    }

    @RequestMapping(value = "/support.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean support(Integer evaluateId){
        return serviceEvaluateService.support(evaluateId);
    }

    @RequestMapping(value = "/unSupport.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean unSupport(Integer evaluateId){
        return serviceEvaluateService.unsupport(evaluateId);
    }


}

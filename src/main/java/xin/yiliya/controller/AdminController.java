package xin.yiliya.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.yiliya.pojo.*;
import xin.yiliya.service.AdminService;
import xin.yiliya.service.OfferServiceService;
import xin.yiliya.service.StoreNewsService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    AdminService adminService;

    @Autowired
    HttpSession httpSession;

    @Autowired
    OfferServiceService offerServiceService;

    @Autowired
    StoreNewsService storeNewsService;

    @RequestMapping(value = "/pageRedirect.do",method = RequestMethod.POST)
    public String pageSearchDo(String q){
        if(q.contains("运")||q.contains("overall")){
            return "redirect:OperationOverview.html";
        }
        else if(q.contains("价")||q.contains("price")){
            return "redirect:priceControll.html";
        }
        else if(q.contains("认")||q.contains("wait")){
            return "redirect:waitStore.html";
        }
        else if(q.contains("操")||q.contains("use")){
            return "redirect:useStore.html";
        }
        else if(q.contains("评")||q.contains("score")){
            return "redirect:scoreAdmin.html";
        }
        else if(q.contains("服")||q.contains("service")){
            return "redirect:serviceAdmin.html";
        }
        else{
            return "redirect:OperationOverview.html";
        }
    }

    @RequestMapping(value = "/OperationOverview.html",method = RequestMethod.GET)
    public String OperationOverviewHTML(Model model){
            model.addAttribute("userTotal",adminService.getUserNum());
            model.addAttribute("storeTotal",adminService.getStoreNum());
            model.addAttribute("passStoreNum",adminService.getPassStoreNum());
            return "admin/OperationOverview";
    }

    @RequestMapping(value = "/nowMonthOrder.do",method = RequestMethod.GET)
    @ResponseBody
    public int[] nowMonthOrderDo(){
        int[] result = new int[12];
        Map<Integer,Integer> map =adminService.getOrderByNowYear(new Date());
        for(Integer i:map.keySet()){
            result[i-1]= map.get(i);
        }
        return result;
    }

    @RequestMapping(value = "/searchOrder.do",method = RequestMethod.POST)
    @ResponseBody
    public int[] searchOrderDo(String timeYear){
        Map<Integer,Integer> map = adminService.getOrderNumPerYear(timeYear);
        int[] result = new int[12];
        for(Integer i : map.keySet()) {
            result[i-1] = map.get(i);
        }
        return result;
    }

    @RequestMapping(value = "/priceControll.html",method = RequestMethod.GET)
    public String priceControllHTML(Model model){
            ArrayList list=new ArrayList();
            Map<String,Float> priceMap=adminService.getRealTimeMarketPrice();
            for(String key:priceMap.keySet()){
                list.add(priceMap.get(key));
            }
            model.addAttribute("priceList",list);
            return "admin/priceControll";
    }

    @RequestMapping(value = "/scoreAdmin.html",method = RequestMethod.GET)
    public String scoreAdminHTML(Model model){
            model.addAttribute("scoreStoreList",adminService.getStoresByGrade((float)10.1,1,2).getList());
            model.addAttribute("pages",adminService.getStoresByGrade((float)10.1,1,2).getPages());
            model.addAttribute("input","none");
            return "admin/scoreAdmin";
    }

    @RequestMapping(value = "/scoreAdmin.do",method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<StoreAdmin> scoreAdminPage(@RequestParam(value = "input",required = false)String input,
                                               @RequestParam(value = "currentPage")Integer currentPage){
        if(input==null){
            return adminService.getStoresByGrade((float)10.1,currentPage,2);
        }
        else{
            return adminService.getStoresByGrade(Float.parseFloat(input.trim()),currentPage,2);
        }
    }

    @RequestMapping(value = "/scoreSearch.do",method = RequestMethod.POST)
    public String searchScore(String input,Model model){
        model.addAttribute("scoreStoreList",adminService.getStoresByGrade(Float.parseFloat(input.trim()),1,2).getList());
        model.addAttribute("pages",adminService.getStoresByGrade(Float.parseFloat(input.trim()),1,2).getPages());
        model.addAttribute("input",input.trim());
        return "admin/scoreAdmin";
    }

    @RequestMapping(value = "/storeYellow.do",method = RequestMethod.GET)
    public String yellowStoreDo(@RequestParam(value = "yellowStoreId")String storeId){
        String[] ids=storeId.split("[^0123456789.]+");
        for(String s:ids){
            StoreNews storeNews=new StoreNews();
            storeNews.setStoreId(Integer.parseInt(s));
            storeNews.setContent("您的店铺被系统进行黄色警告，请注意您对客户的服务态度！");
            storeNews.setStype("公告通知");
            storeNewsService.addNew(storeNews);
        }
        return "redirect:scoreAdmin.html";
    }

    @RequestMapping(value = "/storeRed.do",method = RequestMethod.GET)
    public String redStoreDo(@RequestParam(value = "redStoreId")String storeId){
        String[] ids=storeId.split("[^0123456789.]+");
        for(String s:ids){
            StoreNews storeNews=new StoreNews();
            storeNews.setStoreId(Integer.parseInt(s));
            storeNews.setContent("您的店铺被系统进行红色警告，请注意您对客户的服务态度！");
            storeNews.setStype("公告通知");
            storeNewsService.addNew(storeNews);
        }
        return "redirect:scoreAdmin.html";
    }

    @RequestMapping(value = "/scoreNews.do",method = RequestMethod.POST)
    public String scoreStoreNewsDo(String scoreIds,String type,String content){
        String[] ids=scoreIds.split("[^0123456789.]+");
        for(String s:ids){
            StoreNews storeNews=new StoreNews();
            storeNews.setStoreId(Integer.parseInt(s));
            storeNews.setContent(content);
            storeNews.setStype(type);
            storeNewsService.addNew(storeNews);
        }
        return "redirect:useStore.html";
    }

    @RequestMapping(value = "/serviceAdmin.html",method = RequestMethod.GET)
    public String serviceAdminHTML(Model model){
            model.addAttribute("serviceStoreList",adminService.getUnpassServices(1,2).getList());
            model.addAttribute("pages",adminService.getUnpassServices(1,2).getPages());
            model.addAttribute("input","none");
            return "admin/serviceAdmin";
    }

    @RequestMapping(value = "/serviceAdmin.do",method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<OfferServiceAdmin> serviceAdminPage(@RequestParam(value = "input",required = false)String input,
                                                        @RequestParam(value = "currentPage")Integer currentPage){
        if(input==null){
            return adminService.getUnpassServices(currentPage,2);
        }
        else{
            return adminService.getUnpassServices(input.trim(),currentPage,2);
        }
    }

    @RequestMapping(value = "/serviceSearch.do",method = RequestMethod.POST)
    public String searchService(String input,Model model){
        model.addAttribute("serviceStoreList",adminService.getUnpassServices(input.trim(),1,2).getList());
        model.addAttribute("pages",adminService.getUnpassServices(input.trim(),1,2).getPages());
        model.addAttribute("input",input.trim());
        return "admin/serviceAdmin";
    }

    @RequestMapping(value = "/serviceAgree.do",method = RequestMethod.GET)
    public String agreeServiceDo(@RequestParam(value = "agreeServiceId")String offerServiceId){
        String[] ids=offerServiceId.split("[^0123456789.]+");
        for(String s:ids){
            StoreNews storeNews=new StoreNews();
            storeNews.setStoreId(offerServiceService.getOfferServiceByServiceId(Integer.parseInt(s)).getStoreId());
            storeNews.setContent("您的服务"+offerServiceService.getOfferServiceByServiceId(Integer.parseInt(s)).getServiceName()+"已被认证");
            storeNews.setStype("公告通知");
            storeNewsService.addNew(storeNews);
            adminService.passService(Integer.parseInt(s));
        }
        return "redirect:serviceAdmin.html";
    }

    @RequestMapping(value="/serviceRefuse.do",method = RequestMethod.GET)
    public String refuseServiceDo(@RequestParam(value = "refuseServiceId")String offerServiceId){
        String[] ids=offerServiceId.split("[^0123456789.]+");
        for(String s:ids){
            StoreNews storeNews=new StoreNews();
            storeNews.setStoreId(offerServiceService.getOfferServiceByServiceId(Integer.parseInt(s)).getStoreId());
            storeNews.setContent("您的服务"+offerServiceService.getOfferServiceByServiceId(Integer.parseInt(s)).getServiceName()+"未认证成功");
            storeNews.setStype("公告通知");
            storeNewsService.addNew(storeNews);
            offerServiceService.deleteService(Integer.parseInt(s));
        }
        return "redirect:waitStore.html";
    }

    @RequestMapping(value = "/serviceDetail.do",method = RequestMethod.POST)
    @ResponseBody
    public OfferServiceDetail getServiceDetailDo(Integer offerServiceId){
        return offerServiceService.getSOfferServiceDetailByServiceId(offerServiceId);
    }

    @RequestMapping(value = "/useStore.html",method = RequestMethod.GET)
    public String useStoreHTML(Model model){
            model.addAttribute("useStoreList",adminService.getPassStores(1,2).getList());
            model.addAttribute("pages",adminService.getPassStores(1,2).getPages());
            model.addAttribute("input","none");
            return "admin/useStore";
    }

    @RequestMapping(value = "/useStore.do",method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<StoreAdmin> useStorePage(@RequestParam(value = "input",required = false)String input,
                                             @RequestParam(value = "currentPage")Integer currentPage){
        if(input==null){
            return adminService.getPassStores(currentPage,2);
        }
        else{
            return adminService.getPassStores(input.trim(),currentPage,2);
        }
    }

    @RequestMapping(value = "/storeSearch.do",method = RequestMethod.POST)
    public String searchUseStore(String input,Model model){
        model.addAttribute("useStoreList",adminService.getPassStores(input.trim(),1,2).getList());
        model.addAttribute("pages",adminService.getPassStores(input.trim(),1,2).getPages());
        model.addAttribute("input",input.trim());
        return "admin/useStore";
    }

    @RequestMapping(value = "/cancelStore.do",method = RequestMethod.GET)
    public String cancelStoreDo(@RequestParam(value = "cancelStoreId")String storeId){
        String[] ids=storeId.split("[^0123456789.]+");
        for(String s:ids){
            adminService.cancelStore(Integer.parseInt(s));
        }
        return "redirect:useStore.html";
    }

    @RequestMapping(value = "/useStoreNews.do",method = RequestMethod.POST)
    public String useStoreNewsDo(String storeIds,String type,String content){
        String[] ids=storeIds.split("[^0123456789.]+");
        for(String s:ids){
            StoreNews storeNews=new StoreNews();
            storeNews.setStoreId(Integer.parseInt(s));
            storeNews.setContent(content);
            storeNews.setStype(type);
            storeNewsService.addNew(storeNews);
        }
        return "redirect:useStore.html";
    }

    @RequestMapping(value = "/waitStore.html",method = RequestMethod.GET)
    public String waitStore(Model model){
            model.addAttribute("waitStoreList",adminService.getUnpassStores(1,2).getList());
            model.addAttribute("pages",adminService.getUnpassStores(1,2).getPages());
            model.addAttribute("input","none");
            return "admin/waitStore";
    }

    @RequestMapping(value = "/waitStore.do",method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<StoreAdmin> waitStorePage(@RequestParam(value = "input",required = false)String input,
                                              @RequestParam(value = "currentPage")Integer currentPage){
        if(input==null){
            return adminService.getUnpassStores(currentPage,2);
        }
        else{
            return adminService.getUnpassStores(input.trim(),currentPage,2);
        }
    }

    @RequestMapping(value = "/waitSearch.do",method = RequestMethod.POST)
    public String searchWaitStore(String input,Model model){
        model.addAttribute("waitStoreList",adminService.getUnpassStores(input.trim(),1,2).getList());
        model.addAttribute("pages",adminService.getUnpassStores(input.trim(),1,2).getPages());
        model.addAttribute("input",input.trim());
        return "admin/waitStore";
    }

    @RequestMapping(value = "/AptitudePictures.do",method =RequestMethod.POST )
    @ResponseBody
    public String[] getAptitudePicturesDo(Integer storeId){
        return adminService.getAptitudeByStoreId(storeId);
    }

    @RequestMapping(value = "/agree.do",method = RequestMethod.GET)
    public String agreeWaitStoreDo(@RequestParam(value = "agreeStoreId")String storeId){
        String[] ids=storeId.split("[^0123456789.]+");
        for(String s:ids){
            adminService.passStore(Integer.parseInt(s));
        }
        return "redirect:waitStore.html";
    }

    @RequestMapping(value = "/refuse.do",method = RequestMethod.GET)
    public String refuseWaitStoreDo(@RequestParam(value = "refuseStoreId")String storeId){
        String[] ids=storeId.split("[^0123456789.]+");
        for(String s:ids){
            adminService.refuseStore(Integer.parseInt(s));
        }
        return "redirect:waitStore.html";
    }
}

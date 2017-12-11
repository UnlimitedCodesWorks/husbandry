package xin.yiliya.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.yiliya.pojo.Admin;
import xin.yiliya.pojo.StoreAdmin;
import xin.yiliya.service.AdminService;

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

    @RequestMapping(value = "/login.html",method = RequestMethod.GET)
    public String loginHTML(){
        return "admin/bgmanagement_login";
    }

    @RequestMapping(value = "/login.do",method = RequestMethod.POST)
    public String loginDo(String adminname,String password){
        Admin admin=adminService.AdminLogin(adminname,password);
        if (admin==null){
            return "redirect:login.html";
        }
        else{
            httpSession.setAttribute("adminBean",admin);
            return "redirect:OperationOverview.html";
        }
    }

    @RequestMapping(value = "/OperationOverview.html",method = RequestMethod.GET)
    public String OperationOverviewHTML(Model model){
        if(httpSession.getAttribute("adminBean")!=null){
            model.addAttribute("unPassStoreNum",adminService.getUnpassStoreNum());
            model.addAttribute("userTotal",adminService.getUserNum());
            model.addAttribute("storeTotal",adminService.getStoreNum());
            model.addAttribute("passStoreNum",adminService.getPassStoreNum());
            return "admin/OperationOverview";
        }
        else{
            return "redirect:login.html";
        }
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
        if(httpSession.getAttribute("adminBean")!=null){
            model.addAttribute("unPassStoreNum",adminService.getUnpassStoreNum());
            ArrayList list=new ArrayList();
            Map<String,Float> priceMap=adminService.getRealTimeMarketPrice();
            for(String key:priceMap.keySet()){
                list.add(priceMap.get(key));
            }
            model.addAttribute("priceList",list);
            return "admin/priceControll";
        }
        else{
            return "redirect:login.html";
        }
    }


    @RequestMapping(value = "/scoreAdmin.html",method = RequestMethod.GET)
    public String scoreAdminHTML(Model model){
        if(httpSession.getAttribute("adminBean")!=null){
            model.addAttribute("unPassStoreNum",adminService.getUnpassStoreNum());
            return "admin/scoreAdmin";
        }
        else{
            return "redirect:login.html";
        }
    }

    @RequestMapping(value = "/serviceAdmin.html",method = RequestMethod.GET)
    public String serviceAdminHTML(Model model){
        if(httpSession.getAttribute("adminBean")!=null){
            model.addAttribute("unPassStoreNum",adminService.getUnpassStoreNum());
            return "admin/serviceAdmin";
        }
        else{
            return "redirect:login.html";
        }
    }

    @RequestMapping(value = "/useStore.html",method = RequestMethod.GET)
    public String useStoreHTML(Model model){
        if(httpSession.getAttribute("adminBean")!=null){
            model.addAttribute("unPassStoreNum",adminService.getUnpassStoreNum());
            return "admin/useStore";
        }
        else{
            return "redirect:login.html";
        }
    }

    @RequestMapping(value = "/waitStore.html",method = RequestMethod.GET)
    public String waitStore(Model model){
        if(httpSession.getAttribute("adminBean")!=null){
            model.addAttribute("unPassStoreNum",adminService.getUnpassStoreNum());
            model.addAttribute("waitStoreList",adminService.getUnpassStores(1,2).getList());
            model.addAttribute("pages",adminService.getUnpassStores(1,2).getPages());
            return "admin/waitStore";
        }
        else{
            return "redirect:login.html";
        }
    }

    @RequestMapping(value = "/waitStore.do",method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<StoreAdmin> waitStorePage(@RequestParam(value = "currentPage")Integer currentPage){
        return adminService.getUnpassStores(currentPage,2);
    }

    @RequestMapping(value = "/search.do",method = RequestMethod.POST)
    public String searchWaitStore(@RequestParam(required = false,defaultValue = "")String input,Model model){
        model.addAttribute("unPassStoreNum",adminService.getUnpassStoreNum());
        model.addAttribute("waitStoreList",adminService.getUnpassStores(input,1,2).getList());
        model.addAttribute("pages",adminService.getUnpassStores(input.trim(),1,2).getPages());
        return "admin/waitStore";
    }

    @RequestMapping(value = "/AptitudePictures.do",method =RequestMethod.POST )
    @ResponseBody
    public String[] getAptitudePicturesDo(Integer storeId){
        return adminService.getAptitudeByStoreId(storeId);
    }

}

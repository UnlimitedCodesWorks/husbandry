package xin.yiliya.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.yiliya.pojo.OrderCancel;
import xin.yiliya.pojo.Store;
import xin.yiliya.service.OrderService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/storeAdmin",method = RequestMethod.GET)
public class StoreCancelController {

    @Resource
    HttpSession httpSession;

    @Resource
    OrderService orderService;

    @RequestMapping(value = "/storeCancel.html",method = RequestMethod.GET)
    public String storeCancelHTML(Model model){
        Store store = (Store) httpSession.getAttribute("storeBean");
        Integer storeId=store.getStoreid();
        model.addAttribute("storeId",storeId);
        model.addAttribute("cancelOrderList",orderService.getAllStoreCancelOrder(storeId,1,2).getList());
        model.addAttribute("pages",orderService.getAllStoreCancelOrder(storeId,1,2).getPages());
        model.addAttribute("input","none");
        model.addAttribute("type","none");
        return "/storeAdmin/order_wait_refund";
    }

    @RequestMapping(value = "/storeCancel.do",method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<OrderCancel> storeCancelPage(@RequestParam(value = "input",required = false)String input,
                                                 @RequestParam(value = "type",required = false)String type,
                                                 @RequestParam(value = "currentPage")Integer currentPage,
                                                 @RequestParam(value = "storeId")Integer storeId){
        if(input==null&&type==null){
            return orderService.getAllStoreCancelOrder(storeId,currentPage,2);
        }
        else{
            return orderService.getAllStoreCancelOrder(input.trim(),type,storeId,currentPage,2);
        }
    }

    @RequestMapping(value = "/cancelSearch.do",method = RequestMethod.POST)
    public String searchCancelDo(String input,String orderType,Model model){
        Store store = (Store) httpSession.getAttribute("storeBean");
        Integer storeId=store.getStoreid();
        model.addAttribute("storeId",storeId);
        model.addAttribute("cancelOrderList",orderService.getAllStoreCancelOrder(input.trim(),orderType,storeId,1,2).getList());
        model.addAttribute("pages",orderService.getAllStoreCancelOrder(input.trim(),orderType,storeId,1,2).getPages());
        model.addAttribute("input",input.trim());
        model.addAttribute("type",orderType);
        return "/storeAdmin/order_wait_refund";
    }

    @RequestMapping(value = "/cancelAgree.do",method = RequestMethod.GET)
    public String agreeCancelDo(@RequestParam(value = "orderId")String orderId){
        String[] ids=orderId.split("[^0123456789.]+");
        for(String s:ids){
            orderService.storeSureCancelOrder(Integer.parseInt(s));
        }
        return "redirect:storeCancel.html";
    }

    @RequestMapping(value = "/cancelRefuse.do",method = RequestMethod.GET)
    public String refuseCancelDo(@RequestParam(value = "orderId")String orderId){
//        String[] ids=orderId.split("[^0123456789.]+");
//        for(String s:ids){
//
//        }
        return null;
    }

}

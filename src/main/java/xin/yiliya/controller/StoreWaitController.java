package xin.yiliya.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.yiliya.pojo.OrderSimple;
import xin.yiliya.pojo.Store;
import xin.yiliya.service.OrderService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/storeAdmin",method = RequestMethod.GET)
public class StoreWaitController {

    @Resource
    HttpSession httpSession;

    @Resource
    OrderService orderService;

    @RequestMapping(value = "/storeWait.html",method = RequestMethod.GET)
    public String storeWaitHTML(Model model){
        Store store = (Store) httpSession.getAttribute("storeBean");
        Integer storeId=store.getStoreid();
        model.addAttribute("storeId",storeId);
        model.addAttribute("waitOrderList",orderService.getAllStoreHandleOrder(storeId,1,2).getList());
        model.addAttribute("pages",orderService.getAllStoreHandleOrder(storeId,1,2).getPages());
        model.addAttribute("input","none");
        model.addAttribute("type","none");
        return "/storeAdmin/order_wait_handle";
    }

    @RequestMapping(value = "/storeWait.do",method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<OrderSimple> storeWaitPage(@RequestParam(value = "input",required = false)String input,
                                               @RequestParam(value = "type",required = false)String type,
                                               @RequestParam(value = "currentPage")Integer currentPage,
                                               @RequestParam(value = "storeId")Integer storeId){
        if(input==null&&type==null){
            return orderService.getAllStoreHandleOrder(storeId,currentPage,2);
        }
        else{
            return orderService.getAllStoreHandleOrder(input.trim(),type,storeId,currentPage,2);
        }
    }

    @RequestMapping(value = "/waitSearch.do",method = RequestMethod.POST)
    public String searchWaitDo(String input,String orderType,Model model){
        Store store = (Store) httpSession.getAttribute("storeBean");
        Integer storeId=store.getStoreid();
        model.addAttribute("storeId",storeId);
        model.addAttribute("waitOrderList",orderService.getAllStoreHandleOrder(input.trim(),orderType,storeId,1,2).getList());
        model.addAttribute("pages",orderService.getAllStoreHandleOrder(input.trim(),orderType,storeId,1,2).getPages());
        model.addAttribute("input",input.trim());
        model.addAttribute("type",orderType);
        return "/storeAdmin/order_wait_handle";
    }

}

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
public class StoreFinishController {

    @Resource
    HttpSession httpSession;

    @Resource
    OrderService orderService;

    @RequestMapping(value = "/storeFinish.html",method = RequestMethod.GET)
    public String storeFinishHTML(Model model){
        Store store = (Store) httpSession.getAttribute("storeBean");
        Integer storeId=store.getStoreid();
        model.addAttribute("storeId",storeId);
        model.addAttribute("finishOrderList",orderService.getAllStoreFinishOrder(storeId,1,2).getList());
        model.addAttribute("pages",orderService.getAllStoreFinishOrder(storeId,1,2).getPages());
        model.addAttribute("input","none");
        model.addAttribute("type","none");
        return "/storeAdmin/order_finish";
    }

    @RequestMapping(value = "/storeFinish.do",method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<OrderSimple> storeFinishPage(@RequestParam(value = "input",required = false)String input,
                                                 @RequestParam(value = "type",required = false)String type,
                                                 @RequestParam(value = "currentPage")Integer currentPage,
                                                 @RequestParam(value = "storeId")Integer storeId){
        if(input==null&&type==null){
            return orderService.getAllStoreFinishOrder(storeId,currentPage,2);
        }
        else{
            return orderService.getAllStoreFinishOrder(input.trim(),type,storeId,currentPage,2);
        }
    }

    @RequestMapping(value = "/finishSearch.do",method = RequestMethod.POST)
    public String searchFinishDo(String input,String orderType,Model model){
        Store store = (Store) httpSession.getAttribute("storeBean");
        Integer storeId=store.getStoreid();
        model.addAttribute("storeId",storeId);
        model.addAttribute("finishOrderList",orderService.getAllStoreFinishOrder(input.trim(),orderType,storeId,1,2).getList());
        model.addAttribute("pages",orderService.getAllStoreFinishOrder(input.trim(),orderType,storeId,1,2).getPages());
        model.addAttribute("input",input.trim());
        model.addAttribute("type",orderType);
        return "/storeAdmin/order_finish";
    }

}

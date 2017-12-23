package xin.yiliya.controller;

import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.yiliya.pojo.ComplainSimple;
import xin.yiliya.pojo.Store;
import xin.yiliya.service.ComplainService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/storeAdmin",method = RequestMethod.GET)
public class StoreComplainController {

    @Resource
    private HttpSession session;

    @Resource
    private ComplainService complainService;

    @RequestMapping(value = "/complain.html",method = RequestMethod.GET)
    public String complain(Model model){
        Store store = (Store) session.getAttribute("storeBean");
        Integer storeId = store.getStoreid();
        int pageSize = 2;
        PageInfo<ComplainSimple> complainSimplePageInfo = complainService.getAllComplainByStoreId(storeId,1,pageSize);
        model.addAttribute("complains",complainSimplePageInfo.getList());
        model.addAttribute("complainPages",complainSimplePageInfo.getPages());
        model.addAttribute("pageSize",pageSize);
        return "storeAdmin/user_complaint";
    }

    @RequestMapping(value = "/getAllComplainByStoreId.do",method = RequestMethod.POST)
    @ResponseBody
    public List<ComplainSimple> getAllComplainByStoreId(Integer storeId,Integer currentPage){
        int pageSize = 2;
        return complainService.getAllComplainByStoreId(storeId,currentPage,pageSize).getList();
    }

    @RequestMapping(value = "/deleteComplain.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean deleteComplain(@RequestParam(value = "complainIds[]") Integer[] complainIds){
        Boolean b = false;
        for(Integer complainId : complainIds){
            b = complainService.deleteComplainById(complainId);
            if(!b){
                break;
            }
        }
        return b;
    }
}

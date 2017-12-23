package xin.yiliya.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.yiliya.pojo.Store;
import xin.yiliya.pojo.StoreNews;
import xin.yiliya.service.StoreNewsService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/storeAdmin",method = RequestMethod.GET)
public class StoreMessageController {

    @Resource
    private HttpSession session;

    @Resource
    private StoreNewsService storeNewsService;

    @RequestMapping(value = "/message.html",method = RequestMethod.GET)
    public String message(Model model){
        Store store = (Store) session.getAttribute("storeBean");
        Integer storeId = store.getStoreid();
        int pageSize = 10;
        PageInfo<StoreNews> storeNewsPageInfo = storeNewsService.getAllNewsByStoreId(storeId,1,pageSize);
        model.addAttribute("storeNews",storeNewsPageInfo.getList());
        model.addAttribute("storeNewPages",storeNewsPageInfo.getPages());
        model.addAttribute("pageSize",pageSize);
        return "storeAdmin/system_message";
    }

    @RequestMapping(value = "getAllNewsByStoreId.do",method = RequestMethod.POST)
    @ResponseBody
    public List<StoreNews> getAllNewsByStoreId(Integer currentPage,Integer storeId){
        int pageSize = 10;
        return storeNewsService.getAllNewsByStoreId(storeId,currentPage,pageSize).getList();
    }

    @RequestMapping(value = "deleteNews.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean deleteNews(@RequestParam(value = "storeNewsIds[]") Integer[] storeNewsIds){
        Boolean b = false;
        for(Integer storeNewsId : storeNewsIds){
            b=storeNewsService.deleteNewById(storeNewsId);
            if(!b){
                break;
            }
        }
        return b;
    }
}

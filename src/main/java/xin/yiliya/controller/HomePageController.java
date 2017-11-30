package xin.yiliya.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import xin.yiliya.pojo.StoreIndex;
import xin.yiliya.service.StoreService;
import xin.yiliya.tool.Rank;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class HomePageController {

    @Resource
    private StoreService storeService;

    @RequestMapping(value = "/index.html",method = RequestMethod.GET)
    public String index(Model model){
        List<StoreIndex> storeIndexList = storeService.getAllHotStore(Rank.SALES_DESC);
        model.addAttribute("storeIndexList",storeIndexList);
        return "homePage";
    }


}

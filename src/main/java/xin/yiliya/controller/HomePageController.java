package xin.yiliya.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.yiliya.pojo.StoreIndex;
import xin.yiliya.pojo.User;
import xin.yiliya.service.StoreService;
import xin.yiliya.service.UserService;
import xin.yiliya.tool.Rank;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/index.html",method = RequestMethod.GET)
public class HomePageController {

    @Resource
    private StoreService storeService;

    @Resource
    private HttpSession session;

    @Resource
    private UserService userService;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model){
        List<StoreIndex> storeIndexList = storeService.getAllHotStore(Rank.SALES_DESC);
        model.addAttribute("storeIndexList",storeIndexList);
        User user = (User) session.getAttribute("userBean");
        Boolean loginStatus;
        loginStatus = user == null;
        if(!loginStatus){
            User newUser = userService.getUserInfo(user.getRegistNum());
            model.addAttribute("user",newUser);
        }
        model.addAttribute("loginStatus",loginStatus);
        return "homePage";
    }

    @RequestMapping(value = "/rankSale.do",method = RequestMethod.POST)
    @ResponseBody
    public List<StoreIndex> rankSale(){
        return storeService.getAllHotStore(Rank.SALES_DESC);
    }

    @RequestMapping(value = "/rankGrade.do",method = RequestMethod.POST)
    @ResponseBody
    public List<StoreIndex> rankGrade(){
        return storeService.getAllHotStore(Rank.GRADE_DESC);
    }

    @RequestMapping(value = "/rankHit.do",method = RequestMethod.POST)
    @ResponseBody
    public List<StoreIndex> rankHit(){
        return storeService.getAllHotStore(Rank.HITS_DESC);
    }

}

package xin.yiliya.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import xin.yiliya.pojo.Store;
import xin.yiliya.pojo.StoreEvalutePerDay;
import xin.yiliya.pojo.StoreEvalutePerMonth;
import xin.yiliya.service.EvaluateStoreService;
import xin.yiliya.service.StoreNewsService;
import xin.yiliya.service.StoreService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/storeAdmin",method = RequestMethod.GET)
public class StoreScoreController {

    @Resource
    StoreService storeService;

    @Resource
    EvaluateStoreService evaluateStoreService;

    @Resource
    StoreNewsService storeNewsService;

    @Resource
    HttpSession session;

    @RequestMapping(value = "/score/{storeId}",method = RequestMethod.GET)
    public String storeScoreHTML(@PathVariable("storeId") Integer storeId,Model model){
        Store store = (Store) session.getAttribute("storeBean");
        if(store==null){
            return "redirect:/login/user.html";
        }
        else{
            model.addAttribute("storeInfo",storeService.getStoreInfo(storeId));
            model.addAttribute("storeId",storeId);
            StoreEvalutePerMonth storeEvalutePerMonth=evaluateStoreService.getGradePerMonthByStoreId(storeId,store.getStoreName(),new Date());
            model.addAttribute("score",storeEvalutePerMonth);
            List<StoreEvalutePerDay> list=storeEvalutePerMonth.getDays();
            List<Integer> days=new ArrayList<Integer>();
            List<Float> grades=new ArrayList<Float>();
            for(int i=0;i<list.size();i++){
                days.add(list.get(i).getDayNum());
                grades.add(list.get(i).getGrade());
            }
            model.addAttribute("days",days);
            model.addAttribute("grades",grades);
            model.addAttribute("unReadNews",storeNewsService.getUnreadNumByStoreId(storeId));
            return "/storeAdmin/store_score";
        }
    }

    @RequestMapping(value = "/exit.do",method = RequestMethod.GET)
    public String exitDo(){
        if(session!=null){
            session.invalidate();
        }
        return "redirect:/login/user.html";
    }
}

package xin.yiliya.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import xin.yiliya.pojo.Store;
import xin.yiliya.pojo.StoreEvalutePerDay;
import xin.yiliya.pojo.StoreEvalutePerMonth;
import xin.yiliya.service.EvaluateStoreService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/storeAdmin",method = RequestMethod.GET)
public class StoreScoreController {

    @Resource
    EvaluateStoreService evaluateStoreService;

    @Resource
    HttpSession httpSession;

    @RequestMapping(value = "/storeScore.html",method = RequestMethod.GET)
    public String storeScoreHTML(Model model){
        Store store = (Store) httpSession.getAttribute("storeBean");
        model.addAttribute("storeId",store.getStoreid());
        StoreEvalutePerMonth storeEvalutePerMonth=evaluateStoreService.getGradePerMonthByStoreId(store.getStoreid(),store.getStoreName(),new Date());
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
        return "/storeAdmin/store_score";
    }
}

package xin.yiliya.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/storeAdmin",method = RequestMethod.GET)
public class StoreScoreController {

    @RequestMapping(value = "/score.html",method = RequestMethod.GET)
    public String storeScoreHTML(){
        return "/storeAdmin/store_score";
    }

}

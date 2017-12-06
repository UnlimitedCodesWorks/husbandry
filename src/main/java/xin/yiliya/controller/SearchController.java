package xin.yiliya.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import xin.yiliya.pojo.OfferServiceSimple;
import xin.yiliya.pojo.User;
import xin.yiliya.service.OfferServiceService;
import xin.yiliya.service.RegionService;
import xin.yiliya.tool.Rank;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/search",method = RequestMethod.GET)
public class SearchController {

    @Resource
    private HttpSession session;

    @Resource
    private OfferServiceService offerService;

    @Resource
    private RegionService regionService;

    @RequestMapping(value = "/view.html",method = RequestMethod.GET)
    public String searchView(@RequestParam(value = "kind")Integer kind,
                             @RequestParam(value = "content",required = false) String content,
                             @RequestParam(value = "rank",required = false) Integer rank,
                             @RequestParam(value = "ciid",required = false) Integer ciid,
                             Model model){
        User user = (User) session.getAttribute("userBean");
        String provinceId;
        Integer rankId = Rank.PRICE_DESC;
        if(user!=null){
            ciid = user.getCityId();
        }else if(ciid==null){
            //return "login";
            ciid = 186;
        }
        if(rank!=null){
            rankId = rank;
        }
        provinceId = regionService.selectProvinceIdByciid(ciid);
        PageInfo<OfferServiceSimple> pageInfo;
        if(content != null){
            pageInfo = offerService.getServicesByInput(content, kind,ciid,rankId ,1,1);
        }else{
            pageInfo = offerService.getServicesByCityAndKind(kind,ciid,rankId,1,1);
        }
        model.addAttribute("offerServiceList",pageInfo.getList());
        model.addAttribute("pages",pageInfo.getPages());
        model.addAttribute("provinces",regionService.getAllProvinces());
        model.addAttribute("citys",regionService.getAllCitiesByProvince(provinceId));
        model.addAttribute("ciid",ciid);
        model.addAttribute("provinceId",provinceId);
        return "search";
    }

}

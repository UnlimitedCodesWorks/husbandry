package xin.yiliya.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.yiliya.pojo.OfferServiceSimple;
import xin.yiliya.pojo.User;
import xin.yiliya.service.OfferServiceService;
import xin.yiliya.service.RegionService;
import xin.yiliya.service.UserService;
import xin.yiliya.tool.Rank;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping(value = "/search",method = RequestMethod.GET)
public class SearchController {

    @Resource
    private HttpSession session;

    @Resource
    private OfferServiceService offerService;

    @Resource
    private RegionService regionService;

    @Resource
    private UserService userService;

    @RequestMapping(value = "/view.html",method = RequestMethod.GET)
    public String searchView(@RequestParam(value = "kind")Integer kind,
                             @RequestParam(value = "content",required = false) String content,
                             @RequestParam(value = "rank",required = false) Integer rank,
                             @RequestParam(value = "ciid",required = false) Integer ciid,
                             Model model){
        User user = (User) session.getAttribute("userBean");
        User newUser = userService.getUserInfo(user.getUserid());
        String provinceId;
        Integer rankId = Rank.PRICE_DESC;
        if(ciid ==null){
            ciid = newUser.getCityId();
        }
        model.addAttribute("user",newUser);
        if(rank!=null){
            rankId = rank;
        }
        provinceId = regionService.selectProvinceIdByciid(ciid);
        PageInfo<OfferServiceSimple> pageInfo;
        if(content != null){
            pageInfo = offerService.getServicesByInput(content, kind,ciid,rankId ,1,8);
        }else{
            pageInfo = offerService.getServicesByCityAndKind(kind,ciid,rankId,1,8);
        }
        model.addAttribute("offerServiceList",pageInfo.getList());
        model.addAttribute("pages",pageInfo.getPages());
        model.addAttribute("provinces",regionService.getAllProvinces());
        model.addAttribute("citys",regionService.getAllCitiesByProvince(provinceId));
        model.addAttribute("ciid",ciid);
        model.addAttribute("provinceId",provinceId);
        model.addAttribute("rank",rankId);
        model.addAttribute("content",content);
        model.addAttribute("redContent","<span class='red_font'>"+content+"</span>");
        return "search";
    }

    @RequestMapping(value = "/search.do",method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<OfferServiceSimple> seachAjax(@RequestParam(value = "kind")Integer kind,
                                              @RequestParam(value = "currentPage")Integer currentPage,
                                              @RequestParam(value = "content",required = false) String content,
                                              @RequestParam(value = "rank",required = false) Integer rank,
                                              @RequestParam(value = "ciid",required = false) Integer ciid,
                                                  HttpServletResponse response) throws IOException {
        User user = (User) session.getAttribute("userBean");
        User newUser = userService.getUserInfo(user.getUserid());
        Integer rankId = Rank.PRICE_DESC;
        if(ciid ==null){
            ciid = newUser.getCityId();
        }
        if(rank!=null){
            rankId = rank;
        }
        PageInfo<OfferServiceSimple> pageInfo;
        if(content != null){
            pageInfo = offerService.getServicesByInput(content, kind,ciid,rankId,currentPage,8);
        }else{
            pageInfo = offerService.getServicesByCityAndKind(kind,ciid,rankId,currentPage,8);
        }
        return pageInfo;
    }
}

package xin.yiliya.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.yiliya.pojo.OfferServiceTemplate;
import xin.yiliya.pojo.Store;
import xin.yiliya.service.OfferServiceService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/storeAdmin",method = RequestMethod.GET)
public class StoreServiceTemplateController {

    @Resource
    private HttpSession session;

    @Resource
    private OfferServiceService offerServiceService;

    @RequestMapping(value = "/serviceTemplate.html",method = RequestMethod.GET)
    public String serviceTemplate(Model model){
        Store store = (Store) session.getAttribute("storeBean");
        Integer storeId = store.getStoreid();
        int pageSize = 1;
        PageInfo<OfferServiceTemplate> offerServiceTemplatePageInfo = offerServiceService.getAllOfferServiceTemplateByStoreId(storeId,1,pageSize);
        model.addAttribute("serviceTemplates",offerServiceTemplatePageInfo.getList());
        model.addAttribute("serviceTemplatePages",offerServiceTemplatePageInfo.getPages());
        model.addAttribute("pageSize",pageSize);
        return "storeAdmin/service_template";
    }

    @RequestMapping(value = "/getServiceTemplate.do",method = RequestMethod.POST)
    @ResponseBody
    public List<OfferServiceTemplate> getServiceTemplate(Integer currentPage){
        Store store = (Store) session.getAttribute("storeBean");
        Integer storeId = store.getStoreid();
        int pageSize = 1;
        return offerServiceService.getAllOfferServiceTemplateByStoreId(storeId,currentPage,pageSize).getList();
    }

    @RequestMapping(value = "/getOfferServiceTemplateByTemplateId.do",method = RequestMethod.POST)
    @ResponseBody
    public OfferServiceTemplate getOfferServiceTemplateByTemplateId(Integer templateId){
        return offerServiceService.getOfferServiceTemplateByTemplateId(templateId);
    }

    @RequestMapping(value = "/deleteTemplate.do",method = RequestMethod.POST)
    @ResponseBody
    public Boolean deleteTemplate(@RequestParam(value = "templateIds[]") Integer[] templateIds){
        Boolean b = false;
        for(Integer templateId : templateIds){
            b = offerServiceService.deleteServiceTemplate(templateId);
            if(!b){
                break;
            }
        }
        return b;
    }

}

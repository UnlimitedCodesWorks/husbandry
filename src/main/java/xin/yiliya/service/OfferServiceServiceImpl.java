package xin.yiliya.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.*;
import xin.yiliya.pojo.*;
import xin.yiliya.tool.AliOssTool;
import xin.yiliya.tool.GradeJudge;
import xin.yiliya.tool.Rank;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

@Service
public class OfferServiceServiceImpl implements OfferServiceService {

    @Resource
    private AliOssTool aliOssTool;

    @Resource
    private OfferServiceMapper offerServiceMapper;

    @Resource
    private ServiceSpecialMapper serviceSpecialMapper;

    @Resource
    private ServiceSpotsMapper serviceSpotsMapper;

    @Resource
    private StoreMapper storeMapper;

    @Resource
    private CitiesMapper citiesMapper;

    @Resource
    private OfferServiceTemplateMapper offerServiceTemplateMapper;

    @Resource
    private ServiceEvaluateService serviceEvaluateService;

    @Resource
    private EvaluateServiceMapper evaluateServiceMapper;

    @Resource
    private OrderService orderService;

    @Resource
    private ServiceService serviceService;

    public Integer addService(OfferServiceAdd offerServiceAdd, Boolean ifTemplate) {
        try{
            OfferService offerService = new OfferService();
            BeanUtils.copyProperties(offerService,offerServiceAdd);
            offerService.setPublishTime(new Date());
            offerService.setUpdateTime(new Date());
            offerService.setView_num(0);
            offerService.setServiceImg(aliOssTool.putImage(offerServiceAdd.getServiceImg(),"store"));
            if(!ifTemplate){
                //设置状态0为待审核
                offerService.setStatus(0);
            }else{
                //设置状态为模板状态-1
                offerService.setStatus(-1);
            }
            offerServiceMapper.insertSelective(offerService);
            Integer offerserviceId = offerService.getOfferserviceid();
            List<String> links = aliOssTool.putImages(offerServiceAdd.getServiceSpecial(),"store");
            for(String link : links){
                ServiceSpecial serviceSpecial = new ServiceSpecial();
                serviceSpecial.setOfferserviceId(offerserviceId);
                serviceSpecial.setSpecialImg(link);
                serviceSpecialMapper.insertSelective(serviceSpecial);
            }
            String[] cityIds = offerServiceAdd.getCityIds();
            for(String cityId : cityIds){
                ServiceSpotsKey serviceSpotsKey = new ServiceSpotsKey();
                serviceSpotsKey.setCityId(citiesMapper.selectCiidByCityId(cityId));
                serviceSpotsKey.setOfferserviceId(offerserviceId);
                serviceSpotsMapper.insertSelective(serviceSpotsKey);
            }

            return offerserviceId;
        }catch (Exception e){
            return 0;
        }
    }

    public Integer addServiceTemplate(OfferServiceTemplate offerServiceTemplate, OfferServiceAdd offerServiceAdd) {
        try{
            Integer offerserviceId = addService(offerServiceAdd,true);
            offerServiceTemplate.setOfferserviceId(offerserviceId);
            offerServiceTemplateMapper.insertSelective(offerServiceTemplate);
            return offerServiceTemplate.getServicetemplateid();
        }catch (Exception e){
            return 0;
        }
    }

    public Boolean updateService(OfferServiceUpdate offerServiceUpdate,Boolean ifTemplate) {
        try{
            OfferService offerService = new OfferService();
            BeanUtils.copyProperties(offerService,offerServiceUpdate);
            offerService.setOfferserviceid(offerServiceUpdate.getOfferServiceId());
            offerService.setUpdateTime(new Date());
            if(!ifTemplate){
                offerService.setStatus(0);
            }
            if(offerServiceUpdate.getServiceImg()!=null){
                if(offerServiceUpdate.getServiceImgLink()!=null){
                    aliOssTool.deleteFileByLink(offerServiceUpdate.getServiceImgLink());
                }
                offerService.setServiceImg(aliOssTool.putImage(offerServiceUpdate.getServiceImg(),"store"));
            }
            if(offerServiceUpdate.getServiceSpecialLink()!=null){
                String[] links = offerServiceUpdate.getServiceSpecialLink();
                for(String link:links){
                    aliOssTool.deleteFileByLink(link);
                    serviceSpecialMapper.deleteByLink(link);
                }
            }
            if(offerServiceUpdate.getServiceSpecial()!=null){
                List<String> links = aliOssTool.putImages(offerServiceUpdate.getServiceSpecial(),"store");
                for(String link : links){
                    ServiceSpecial serviceSpecial = new ServiceSpecial();
                    serviceSpecial.setOfferserviceId(offerServiceUpdate.getOfferServiceId());
                    serviceSpecial.setSpecialImg(link);
                    serviceSpecialMapper.insertSelective(serviceSpecial);
                }
            }
            if(offerServiceUpdate.getDeleteCityIds()!=null){
                String[] cityIds = offerServiceUpdate.getDeleteCityIds();
                for(String cityId : cityIds){
                    ServiceSpotsKey serviceSpotsKey = new ServiceSpotsKey();
                    serviceSpotsKey.setCityId(citiesMapper.selectCiidByCityId(cityId));
                    serviceSpotsKey.setOfferserviceId(offerServiceUpdate.getOfferServiceId());
                    serviceSpotsMapper.deleteByPrimaryKey(serviceSpotsKey);
                }
            }
            if(offerServiceUpdate.getCityIds()!=null){
                String[] cityIds = offerServiceUpdate.getCityIds();
                for(String cityId : cityIds){
                    ServiceSpotsKey serviceSpotsKey = new ServiceSpotsKey();
                    serviceSpotsKey.setCityId(citiesMapper.selectCiidByCityId(cityId));
                    serviceSpotsKey.setOfferserviceId(offerServiceUpdate.getOfferServiceId());
                    serviceSpotsMapper.insertSelective(serviceSpotsKey);
                }
            }
            offerServiceMapper.updateByPrimaryKeySelective(offerService);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public Boolean updateServiceTemplate(OfferServiceTemplate offerServiceTemplate, OfferServiceUpdate offerServiceUpdate) {
        try{
            updateService(offerServiceUpdate,true);
            offerServiceTemplateMapper.updateByPrimaryKeySelective(offerServiceTemplate);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public Boolean deleteService(Integer serviceId) {
       try{
            aliOssTool.deleteFileByLink(offerServiceMapper.getLinkByServiceId(serviceId));
            List<String> links = serviceSpecialMapper.getLinksByServiceId(serviceId);
            for (String link : links){
                aliOssTool.deleteFileByLink(link);
            }
            offerServiceMapper.deleteByPrimaryKey(serviceId);
            return true;
       }catch (Exception e){
            return false;
       }
    }

    public Boolean deleteServiceTemplate(Integer templateId) {
        try{
            Integer serviceId = offerServiceTemplateMapper.getServiceIdByTemplateId(templateId);
            aliOssTool.deleteFileByLink(offerServiceMapper.getLinkByServiceId(serviceId));
            List<String> links = serviceSpecialMapper.getLinksByServiceId(serviceId);
            for (String link : links){
                aliOssTool.deleteFileByLink(link);
            }
            offerServiceTemplateMapper.deleteByPrimaryKey(templateId);
            serviceSpotsMapper.deleteByServiceId(serviceId);
            serviceSpecialMapper.deleteByServiceId(serviceId);
            offerServiceMapper.deleteByPrimaryKey(serviceId);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public PageInfo<OfferServiceSimple> getAllSimpleOfferServiceByStoreId(
            Integer storeId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<OfferServiceSimple> list = offerServiceMapper.getAllSimpleOfferServiceByStoreId(storeId);
        for(OfferServiceSimple offerServiceSimple:list){
            Integer offerServiceId=offerServiceSimple.getOfferServiceId();
            offerServiceSimple.setGrade(serviceEvaluateService.getGradeByServiceId(offerServiceId));
            offerServiceSimple.setStatus(GradeJudge.judge(offerServiceSimple.getGrade()));
            offerServiceSimple.setMarkNum(offerServiceMapper.getServiceOfMarkNum(offerServiceId));
            offerServiceSimple.setServiceFans(offerServiceMapper.getServiceOfFans(offerServiceId));
        }
        return new PageInfo<OfferServiceSimple>(list);
    }

    public PageInfo<OfferServiceSimple> getSAllSimpleOfferServiceByStoreId(Integer storeId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<OfferServiceSimple> list = offerServiceMapper.getSAllSimpleOfferServiceByStoreId(storeId);
        return new PageInfo<OfferServiceSimple>(list);
    }

    public PageInfo<OfferServiceTemplate> getAllOfferServiceTemplateByStoreId(
            Integer storeId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<OfferServiceTemplate> list =
                offerServiceTemplateMapper.getAllOfferServiceTemplateByStoreId(storeId);
        return new PageInfo<OfferServiceTemplate>(list);
    }

    public OfferServiceDetail getOfferServiceDetailByServiceId(Integer serviceId) {
        OfferServiceDetail offerServiceDetail = offerServiceMapper.getOfferServiceDetailByServiceId(serviceId);
        Integer storeId = offerServiceDetail.getStoreId();
        offerServiceDetail.setStore(storeMapper.selectStoreSimpleByStoreId(storeId));
        offerServiceDetail.setCities(offerServiceMapper.getCitiesByServiceId(offerServiceDetail.getOfferserviceid()));
        offerServiceDetail.setMarkNum(serviceEvaluateService.getAllEvaluateByServiceId(serviceId,true,1,0,1).getList().size());
        offerServiceDetail.setGrade(serviceEvaluateService.getGradeByServiceId(serviceId));
        offerServiceDetail.setOrderNum(orderService.getServiceTypeFinish(serviceId));
        float marketPrice = serviceService.getServiceKindPrice(offerServiceDetail.getSerid());
        if(marketPrice< Float.parseFloat(offerServiceDetail.getPrice())){
            offerServiceDetail.setPriceJudgement(true);
        }else{
            offerServiceDetail.setPriceJudgement(false);
        }
        return offerServiceDetail;
    }

    public OfferServiceDetail getSOfferServiceDetailByServiceId(Integer serviceId) {
        OfferServiceDetail offerServiceDetail = offerServiceMapper.getSOfferServiceDetailByServiceId(serviceId);
        offerServiceDetail.setCities(offerServiceMapper.getCitiesByServiceId(offerServiceDetail.getOfferserviceid()));
        return  offerServiceDetail;
    }

    public OfferServiceDetail getTOfferServiceDetailByServiceId(Integer serviceId) {
        OfferServiceDetail offerServiceDetail = offerServiceMapper.getTOfferServiceDetailByServiceId(serviceId);
        offerServiceDetail.setCities(offerServiceMapper.getCitiesByServiceId(offerServiceDetail.getOfferserviceid()));
        return  offerServiceDetail;
    }

    public OfferService getOfferServiceByServiceId(Integer offerServiceId) {
        return offerServiceMapper.selectByPrimaryKey(offerServiceId);
    }

    public Boolean increaseViewNumByServiceId(Integer serviceId) {
        try {
            offerServiceMapper.increaseViewNumByServiceId(serviceId);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public OfferServiceTemplate getOfferServiceTemplateByTemplateId(Integer templateId) {
        OfferServiceTemplate offerServiceTemplate = offerServiceTemplateMapper.selectByPrimaryKey(templateId);
        offerServiceTemplate.setOfferServiceDetail(getTOfferServiceDetailByServiceId(offerServiceTemplate.getOfferserviceId()));
        return offerServiceTemplate;
    }

    public PageInfo<OfferServiceSimple> getServicesByCityAndKind(
            Integer serviceKind, Integer ciid, int schema,int currentPage,int pageSize) {
        List<OfferServiceSimple> list;
        switch (schema){
            default:
                PageHelper.startPage(currentPage,pageSize);
                list = offerServiceMapper.getServicesByCityAndKind(serviceKind,ciid);
                for(OfferServiceSimple object: list){
                    object.setGrade(serviceEvaluateService.getGradeByServiceId(object.getOfferServiceId()));
                    object.setMarkNum(orderService.getServiceTypeFinish(object.getOfferServiceId()));
                    object.setGradeNum(
                            evaluateServiceMapper.getGradeNumByServiceId(object.getOfferServiceId()));
                    float marketPrice = serviceService.getServiceKindPrice(object.getKind().getSerid());
                    object.setMarketPrice(marketPrice);
                    if(marketPrice<Float.parseFloat(object.getPrice())){
                        object.setPriceJudge(true);
                    }else {
                        object.setPriceJudge(false);
                    }
                }
                Collections.sort(list,new Comparator<OfferServiceSimple>(){
                    public int compare(OfferServiceSimple o1, OfferServiceSimple o2) {
                        if(o1.getGrade()<o2.getGrade()) return 1;
                        else if(o1.getGrade()>o2.getGrade()) return -1;
                        return 0;
                    }
                });
                break;
            case Rank.PRICE_ASC :
                PageHelper.startPage(currentPage,pageSize);
                PageHelper.orderBy("price");
                list = offerServiceMapper.getServicesByCityAndKind(serviceKind,ciid);
                for(OfferServiceSimple object: list){
                    object.setGrade(serviceEvaluateService.getGradeByServiceId(object.getOfferServiceId()));
                    object.setMarkNum(orderService.getServiceTypeFinish(object.getOfferServiceId()));
                    object.setGradeNum(
                            evaluateServiceMapper.getGradeNumByServiceId(object.getOfferServiceId()));
                    float marketPrice = serviceService.getServiceKindPrice(object.getKind().getSerid());
                    object.setMarketPrice(marketPrice);
                    if(marketPrice<Float.parseFloat(object.getPrice())){
                        object.setPriceJudge(true);
                    }else {
                        object.setPriceJudge(false);
                    }
                }
                break;
            case Rank.PRICE_DESC :
                PageHelper.startPage(currentPage,pageSize);
                PageHelper.orderBy("price desc");
                list = offerServiceMapper.getServicesByCityAndKind(serviceKind,ciid);
                for(OfferServiceSimple object: list){
                    object.setGrade(serviceEvaluateService.getGradeByServiceId(object.getOfferServiceId()));
                    object.setMarkNum(orderService.getServiceTypeFinish(object.getOfferServiceId()));
                    object.setGradeNum(
                            evaluateServiceMapper.getGradeNumByServiceId(object.getOfferServiceId()));
                    float marketPrice = serviceService.getServiceKindPrice(object.getKind().getSerid());
                    object.setMarketPrice(marketPrice);
                    if(marketPrice<Float.parseFloat(object.getPrice())){
                        object.setPriceJudge(true);
                    }else {
                        object.setPriceJudge(false);
                    }
                }
                break;
            case Rank.GRADE_ASC :
                PageHelper.startPage(currentPage,pageSize);
                list = offerServiceMapper.getServicesByCityAndKind(serviceKind,ciid);
                for(OfferServiceSimple object: list){
                    object.setGrade(serviceEvaluateService.getGradeByServiceId(object.getOfferServiceId()));
                    object.setMarkNum(orderService.getServiceTypeFinish(object.getOfferServiceId()));
                    object.setGradeNum(
                            evaluateServiceMapper.getGradeNumByServiceId(object.getOfferServiceId()));
                    float marketPrice = serviceService.getServiceKindPrice(object.getKind().getSerid());
                    object.setMarketPrice(marketPrice);
                    if(marketPrice<Float.parseFloat(object.getPrice())){
                        object.setPriceJudge(true);
                    }else {
                        object.setPriceJudge(false);
                    }
                }
                Collections.sort(list,new Comparator<OfferServiceSimple>(){
                    public int compare(OfferServiceSimple o1, OfferServiceSimple o2) {
                        if(o1.getGrade()>o2.getGrade()) return 1;
                        else if(o1.getGrade()<o2.getGrade()) return -1;
                        return 0;
                    }
                });
                break;
            case Rank.GRADE_DESC :
                PageHelper.startPage(currentPage,pageSize);
                list = offerServiceMapper.getServicesByCityAndKind(serviceKind,ciid);
                for(OfferServiceSimple object: list){
                    object.setGrade(serviceEvaluateService.getGradeByServiceId(object.getOfferServiceId()));
                    object.setMarkNum(orderService.getServiceTypeFinish(object.getOfferServiceId()));
                    object.setGradeNum(
                            evaluateServiceMapper.getGradeNumByServiceId(object.getOfferServiceId()));
                    float marketPrice = serviceService.getServiceKindPrice(object.getKind().getSerid());
                    object.setMarketPrice(marketPrice);
                    if(marketPrice<Float.parseFloat(object.getPrice())){
                        object.setPriceJudge(true);
                    }else {
                        object.setPriceJudge(false);
                    }
                }
                Collections.sort(list,new Comparator<OfferServiceSimple>(){
                    public int compare(OfferServiceSimple o1, OfferServiceSimple o2) {
                        if(o1.getGrade()<o2.getGrade()) return 1;
                        else if(o1.getGrade()>o2.getGrade()) return -1;
                        return 0;
                    }
                });
                break;
            case Rank.SALES_ASC :
                PageHelper.startPage(currentPage,pageSize);
                list = offerServiceMapper.getServicesByCityAndKind(serviceKind,ciid);
                for(OfferServiceSimple object: list){
                    object.setGrade(serviceEvaluateService.getGradeByServiceId(object.getOfferServiceId()));
                    object.setMarkNum(orderService.getServiceTypeFinish(object.getOfferServiceId()));
                    object.setGradeNum(
                            evaluateServiceMapper.getGradeNumByServiceId(object.getOfferServiceId()));
                    float marketPrice = serviceService.getServiceKindPrice(object.getKind().getSerid());
                    object.setMarketPrice(marketPrice);
                    if(marketPrice<Float.parseFloat(object.getPrice())){
                        object.setPriceJudge(true);
                    }else {
                        object.setPriceJudge(false);
                    }
                }
                Collections.sort(list,new Comparator<OfferServiceSimple>(){
                    public int compare(OfferServiceSimple o1, OfferServiceSimple o2) {
                        if(o1.getMarkNum()>o2.getMarkNum()) return 1;
                        else if(o1.getMarkNum()<o2.getMarkNum()) return -1;
                        return 0;
                    }
                });
                break;
            case Rank.SALES_DESC :
                PageHelper.startPage(currentPage,pageSize);
                list = offerServiceMapper.getServicesByCityAndKind(serviceKind,ciid);
                for(OfferServiceSimple object: list){
                    object.setGrade(serviceEvaluateService.getGradeByServiceId(object.getOfferServiceId()));
                    object.setMarkNum(orderService.getServiceTypeFinish(object.getOfferServiceId()));
                    object.setGradeNum(
                            evaluateServiceMapper.getGradeNumByServiceId(object.getOfferServiceId()));
                    float marketPrice = serviceService.getServiceKindPrice(object.getKind().getSerid());
                    object.setMarketPrice(marketPrice);
                    if(marketPrice<Float.parseFloat(object.getPrice())){
                        object.setPriceJudge(true);
                    }else {
                        object.setPriceJudge(false);
                    }
                }
                Collections.sort(list,new Comparator<OfferServiceSimple>(){
                    public int compare(OfferServiceSimple o1, OfferServiceSimple o2) {
                        if(o1.getMarkNum()<o2.getMarkNum()) return 1;
                        else if(o1.getMarkNum()>o2.getMarkNum()) return -1;
                        return 0;
                    }
                });
                break;
        }
        return new PageInfo<OfferServiceSimple>(list);
    }

    public String[] getServiceNameByInput(String input, Integer ciid) {
        return offerServiceMapper.getServiceNameByInput(input,ciid);
    }

    public PageInfo<OfferServiceSimple> getServicesByInput(
            String input,Integer serviceKind, Integer ciid, int schema, int currentPage, int pageSize) {
        List<OfferServiceSimple> list;
        switch (schema){
            default:
                PageHelper.startPage(currentPage,pageSize);
                list = offerServiceMapper.getServicesByInput(input,serviceKind,ciid);
                for(OfferServiceSimple object: list){
                    object.setGrade(serviceEvaluateService.getGradeByServiceId(object.getOfferServiceId()));
                    object.setMarkNum(orderService.getServiceTypeFinish(object.getOfferServiceId()));
                    object.setGradeNum(
                            evaluateServiceMapper.getGradeNumByServiceId(object.getOfferServiceId()));
                    float marketPrice = serviceService.getServiceKindPrice(object.getKind().getSerid());
                    object.setMarketPrice(marketPrice);
                    if(marketPrice<Float.parseFloat(object.getPrice())){
                        object.setPriceJudge(true);
                    }else {
                        object.setPriceJudge(false);
                    }
                }
                Collections.sort(list,new Comparator<OfferServiceSimple>(){
                    public int compare(OfferServiceSimple o1, OfferServiceSimple o2) {
                        if(o1.getGrade()<o2.getGrade()) return 1;
                        else if(o1.getGrade()>o2.getGrade()) return -1;
                        return 0;
                    }
                });
                break;
            case Rank.PRICE_ASC :
                PageHelper.startPage(currentPage,pageSize);
                PageHelper.orderBy("price");
                list = offerServiceMapper.getServicesByInput(input,serviceKind,ciid);
                for(OfferServiceSimple object: list){
                    object.setGrade(serviceEvaluateService.getGradeByServiceId(object.getOfferServiceId()));
                    object.setMarkNum(orderService.getServiceTypeFinish(object.getOfferServiceId()));
                    object.setGradeNum(
                            evaluateServiceMapper.getGradeNumByServiceId(object.getOfferServiceId()));
                    float marketPrice = serviceService.getServiceKindPrice(object.getKind().getSerid());
                    object.setMarketPrice(marketPrice);
                    if(marketPrice<Float.parseFloat(object.getPrice())){
                        object.setPriceJudge(true);
                    }else {
                        object.setPriceJudge(false);
                    }
                }
                break;
            case Rank.PRICE_DESC :
                PageHelper.startPage(currentPage,pageSize);
                PageHelper.orderBy("price desc");
                list = offerServiceMapper.getServicesByInput(input,serviceKind,ciid);
                for(OfferServiceSimple object: list){
                    object.setGrade(serviceEvaluateService.getGradeByServiceId(object.getOfferServiceId()));
                    object.setMarkNum(orderService.getServiceTypeFinish(object.getOfferServiceId()));
                    object.setGradeNum(
                            evaluateServiceMapper.getGradeNumByServiceId(object.getOfferServiceId()));
                    float marketPrice = serviceService.getServiceKindPrice(object.getKind().getSerid());
                    object.setMarketPrice(marketPrice);
                    if(marketPrice<Float.parseFloat(object.getPrice())){
                        object.setPriceJudge(true);
                    }else {
                        object.setPriceJudge(false);
                    }
                }
                break;
            case Rank.GRADE_ASC :
                PageHelper.startPage(currentPage,pageSize);
                list = offerServiceMapper.getServicesByInput(input,serviceKind,ciid);
                for(OfferServiceSimple object: list){
                    object.setGrade(serviceEvaluateService.getGradeByServiceId(object.getOfferServiceId()));
                    object.setMarkNum(orderService.getServiceTypeFinish(object.getOfferServiceId()));
                    object.setGradeNum(
                            evaluateServiceMapper.getGradeNumByServiceId(object.getOfferServiceId()));
                    float marketPrice = serviceService.getServiceKindPrice(object.getKind().getSerid());
                    object.setMarketPrice(marketPrice);
                    if(marketPrice<Float.parseFloat(object.getPrice())){
                        object.setPriceJudge(true);
                    }else {
                        object.setPriceJudge(false);
                    }
                }
                Collections.sort(list,new Comparator<OfferServiceSimple>(){
                    public int compare(OfferServiceSimple o1, OfferServiceSimple o2) {
                        if(o1.getGrade()>o2.getGrade()) return 1;
                        else if(o1.getGrade()<o2.getGrade()) return -1;
                        return 0;
                    }
                });
                break;
            case Rank.GRADE_DESC :
                PageHelper.startPage(currentPage,pageSize);
                list = offerServiceMapper.getServicesByInput(input,serviceKind,ciid);
                for(OfferServiceSimple object: list){
                    object.setGrade(serviceEvaluateService.getGradeByServiceId(object.getOfferServiceId()));
                    object.setMarkNum(orderService.getServiceTypeFinish(object.getOfferServiceId()));
                    object.setGradeNum(
                            evaluateServiceMapper.getGradeNumByServiceId(object.getOfferServiceId()));
                    float marketPrice = serviceService.getServiceKindPrice(object.getKind().getSerid());
                    object.setMarketPrice(marketPrice);
                    if(marketPrice<Float.parseFloat(object.getPrice())){
                        object.setPriceJudge(true);
                    }else {
                        object.setPriceJudge(false);
                    }
                }
                Collections.sort(list,new Comparator<OfferServiceSimple>(){
                    public int compare(OfferServiceSimple o1, OfferServiceSimple o2) {
                        if(o1.getGrade()<o2.getGrade()) return 1;
                        else if(o1.getGrade()>o2.getGrade()) return -1;
                        return 0;
                    }
                });
                break;
            case Rank.SALES_ASC :
                PageHelper.startPage(currentPage,pageSize);
                list = offerServiceMapper.getServicesByInput(input,serviceKind,ciid);
                for(OfferServiceSimple object: list){
                    object.setGrade(serviceEvaluateService.getGradeByServiceId(object.getOfferServiceId()));
                    object.setMarkNum(orderService.getServiceTypeFinish(object.getOfferServiceId()));
                    object.setGradeNum(
                            evaluateServiceMapper.getGradeNumByServiceId(object.getOfferServiceId()));
                    float marketPrice = serviceService.getServiceKindPrice(object.getKind().getSerid());
                    object.setMarketPrice(marketPrice);
                    if(marketPrice<Float.parseFloat(object.getPrice())){
                        object.setPriceJudge(true);
                    }else {
                        object.setPriceJudge(false);
                    }
                }
                Collections.sort(list,new Comparator<OfferServiceSimple>(){
                    public int compare(OfferServiceSimple o1, OfferServiceSimple o2) {
                        if(o1.getMarkNum()>o2.getMarkNum()) return 1;
                        else if(o1.getMarkNum()<o2.getMarkNum()) return -1;
                        return 0;
                    }
                });
                break;
            case Rank.SALES_DESC :
                PageHelper.startPage(currentPage,pageSize);
                list = offerServiceMapper.getServicesByInput(input,serviceKind,ciid);
                for(OfferServiceSimple object: list){
                    object.setGrade(serviceEvaluateService.getGradeByServiceId(object.getOfferServiceId()));
                    object.setMarkNum(orderService.getServiceTypeFinish(object.getOfferServiceId()));
                    object.setGradeNum(
                            evaluateServiceMapper.getGradeNumByServiceId(object.getOfferServiceId()));
                    float marketPrice = serviceService.getServiceKindPrice(object.getKind().getSerid());
                    object.setMarketPrice(marketPrice);
                    if(marketPrice<Float.parseFloat(object.getPrice())){
                        object.setPriceJudge(true);
                    }else {
                        object.setPriceJudge(false);
                    }
                }
                Collections.sort(list,new Comparator<OfferServiceSimple>(){
                    public int compare(OfferServiceSimple o1, OfferServiceSimple o2) {
                        if(o1.getMarkNum()<o2.getMarkNum()) return 1;
                        else if(o1.getMarkNum()>o2.getMarkNum()) return -1;
                        return 0;
                    }
                });
                break;
        }
        return new PageInfo<OfferServiceSimple>(list);
    }

}

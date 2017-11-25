package xin.yiliya.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
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
    private ConcernServiceMapper concernServiceMapper;

    @Resource
    private FeedbackMapper feedbackMapper;

    @Resource
    private ComplainMapper complainMapper;

    public Integer addService(OfferServiceAdd offerServiceAdd,Boolean ifTemplate) {
        try{
            OfferService offerService = new OfferService();
            BeanUtils.copyProperties(offerService,offerServiceAdd);
            offerService.setPublishTime(new Date());
            offerService.setUpdateTime(new Date());
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

    public Boolean updateService(OfferServiceUpdate offerServiceUpdate) {
        try{
            OfferService offerService = new OfferService();
            BeanUtils.copyProperties(offerService,offerServiceUpdate);
            offerService.setUpdateTime(new Date());
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
            return false;
        }
    }

    public Boolean updateServiceTemplate(OfferServiceTemplate offerServiceTemplate, OfferServiceUpdate offerServiceUpdate) {
        try{
            updateService(offerServiceUpdate);
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
            serviceSpotsMapper.deleteByServiceId(serviceId);
            serviceSpecialMapper.deleteByServiceId(serviceId);
            evaluateServiceMapper.deleteByServiceIdCascade(serviceId);
            evaluateServiceMapper.deleteByServiceId(serviceId);
            concernServiceMapper.deleteByServiceId(serviceId);
            feedbackMapper.deleteByServiceId(serviceId);
            complainMapper.deleteByserviceId(serviceId);
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
            offerServiceSimple.setGrade(serviceEvaluateService.getGradeByServiceId(offerServiceSimple.getOfferServiceId()));
            offerServiceSimple.setStatus(GradeJudge.judge(offerServiceSimple.getGrade()));
        }
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
        return offerServiceDetail;
    }

    public OfferServiceTemplate getOfferServiceTemplateByTemplateId(Integer templateId) {
        OfferServiceTemplate offerServiceTemplate = offerServiceTemplateMapper.selectByPrimaryKey(templateId);
        offerServiceTemplate.setOfferServiceDetail(getOfferServiceDetailByServiceId(offerServiceTemplate.getOfferserviceId()));
        return offerServiceTemplate;
    }

    public PageInfo<OfferServiceSimple> getServicesByCityAndKind(
            Integer serviceKind, Integer ciid, int schema,int currentPage,int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<OfferServiceSimple> list = null;
        switch (schema){
            case Rank.PRICE_ASC :
                PageHelper.orderBy("price");
                list = offerServiceMapper.getServicesByCityAndKind(serviceKind,ciid);
                break;
            case Rank.PRICE_DESC :
                PageHelper.orderBy("price desc");
                list = offerServiceMapper.getServicesByCityAndKind(serviceKind,ciid);
                break;
            case Rank.GRADE_ASC :
                list = offerServiceMapper.getServicesByCityAndKind(serviceKind,ciid);
                for(OfferServiceSimple object: list){
                    object.setGrade(serviceEvaluateService.getGradeByServiceId(object.getOfferServiceId()));
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
                list = offerServiceMapper.getServicesByCityAndKind(serviceKind,ciid);
                for(OfferServiceSimple object: list){
                    object.setGrade(serviceEvaluateService.getGradeByServiceId(object.getOfferServiceId()));
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
                list = offerServiceMapper.getServicesByCityAndKind(serviceKind,ciid);
                for(OfferServiceSimple object: list){
                    object.setMarkNum(orderService.getServiceTypeFinish(object.getOfferServiceId()));
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
                list = offerServiceMapper.getServicesByCityAndKind(serviceKind,ciid);
                for(OfferServiceSimple object: list){
                    object.setMarkNum(orderService.getServiceTypeFinish(object.getOfferServiceId()));
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

    public PageInfo<OfferServiceSimple> getServicesByInput(String input, Integer ciid, int schema, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<OfferServiceSimple> list = null;
        switch (schema){
            case Rank.PRICE_ASC :
                PageHelper.orderBy("price");
                list = offerServiceMapper.getServicesByInput(input,ciid);
                break;
            case Rank.PRICE_DESC :
                PageHelper.orderBy("price desc");
                list = offerServiceMapper.getServicesByInput(input,ciid);
                break;
            case Rank.GRADE_ASC :
                list = offerServiceMapper.getServicesByInput(input,ciid);
                for(OfferServiceSimple object: list){
                    object.setGrade(serviceEvaluateService.getGradeByServiceId(object.getOfferServiceId()));
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
                list = offerServiceMapper.getServicesByInput(input,ciid);
                for(OfferServiceSimple object: list){
                    object.setGrade(serviceEvaluateService.getGradeByServiceId(object.getOfferServiceId()));
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
                list = offerServiceMapper.getServicesByInput(input,ciid);
                for(OfferServiceSimple object: list){
                    object.setMarkNum(orderService.getServiceTypeFinish(object.getOfferServiceId()));
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
                list = offerServiceMapper.getServicesByInput(input,ciid);
                for(OfferServiceSimple object: list){
                    object.setMarkNum(orderService.getServiceTypeFinish(object.getOfferServiceId()));
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

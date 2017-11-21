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

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class OfferServiceServiceImpl implements OfferServiceService {

    @Resource
    AliOssTool aliOssTool;

    @Resource
    OfferServiceMapper offerServiceMapper;

    @Resource
    ServiceSpecialMapper serviceSpecialMapper;

    @Resource
    ServiceSpotsMapper serviceSpotsMapper;

    @Resource
    StoreMapper storeMapper;

    @Resource
    CitiesMapper citiesMapper;

    @Resource
    OfferServiceTemplateMapper offerServiceTemplateMapper;

    public Integer addService(OfferServiceAdd offerServiceAdd,Boolean ifTemplate) {
        try{
            OfferService offerService = new OfferService();
            BeanUtils.copyProperties(offerService,offerServiceAdd);
            offerService.setPublishTime(new Date());
            offerService.setUpdateTime(new Date());
            offerService.setServiceImg(aliOssTool.putImage(offerServiceAdd.getServiceImg(),"store"));
            if(ifTemplate == false){
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

    public Boolean deleteService(Integer serviceId) {
        if(offerServiceMapper.deleteByPrimaryKey(serviceId)==1){
            return true;
        }else {
            return false;
        }
    }

    public PageInfo<OfferServiceSimple> getAllSimpleOfferServiceByStoreId(
            Integer storeId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<OfferServiceSimple> list = offerServiceMapper.getAllSimpleOfferServiceByStoreId(storeId);
        PageInfo<OfferServiceSimple> pageInfo = new PageInfo<OfferServiceSimple>(list);
        return pageInfo;
    }

    public OfferServiceDetail getOfferServiceDetailByServiceId(Integer serviceId) {
        OfferServiceDetail offerServiceDetail = new OfferServiceDetail();
        offerServiceDetail = offerServiceMapper.getOfferServiceDetailByServiceId(serviceId);
        Integer storeId = offerServiceDetail.getStoreId();
        offerServiceDetail.setStore(storeMapper.selectStoreSimpleByStoreId(storeId));
        offerServiceDetail.setCities(offerServiceMapper.getCitiesByServiceId(offerServiceDetail.getOfferserviceid()));
        return offerServiceDetail;
    }
}

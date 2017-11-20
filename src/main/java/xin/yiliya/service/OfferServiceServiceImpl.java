package xin.yiliya.service;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.OfferServiceMapper;
import xin.yiliya.dao.ServiceSpecialMapper;
import xin.yiliya.dao.ServiceSpotsMapper;
import xin.yiliya.pojo.OfferService;
import xin.yiliya.pojo.OfferServiceAdd;
import xin.yiliya.pojo.ServiceSpecial;
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

    public Boolean addService(OfferServiceAdd offerServiceAdd) {
        try{
            OfferService offerService = new OfferService();
            BeanUtils.copyProperties(offerService,offerServiceAdd);
            offerService.setPublishTime(new Date());
            offerService.setServiceImg(aliOssTool.putImage(offerServiceAdd.getServiceImg(),"store"));
            //设置状态0为待审核
            offerService.setStatus(0);
            offerServiceMapper.insertSelective(offerService);
            List<String> links = aliOssTool.putImages(offerServiceAdd.getServiceSpecial(),"store");
            for(String link : links){
                ServiceSpecial serviceSpecial = new ServiceSpecial();
                serviceSpecial.setSpecialImg(link);
                serviceSpecialMapper.insertSelective(serviceSpecial);
            }
            return true;
        }catch (Exception e){
            return false;
        }
    }
}

package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.OfferServiceTemplate;

import java.util.List;

@Repository
public interface OfferServiceTemplateMapper {
    int deleteByPrimaryKey(Integer servicetemplateid);

    int insert(OfferServiceTemplate record);

    int insertSelective(OfferServiceTemplate record);

    OfferServiceTemplate selectByPrimaryKey(Integer servicetemplateid);

    int getServiceIdByTemplateId(Integer templateId);

    int updateByPrimaryKeySelective(OfferServiceTemplate record);

    int updateByPrimaryKey(OfferServiceTemplate record);

    List<OfferServiceTemplate> getAllOfferServiceTemplateByStoreId(Integer storeId);
}
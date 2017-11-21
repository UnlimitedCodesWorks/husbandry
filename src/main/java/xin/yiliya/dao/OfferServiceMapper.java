package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.Cities;
import xin.yiliya.pojo.OfferService;
import xin.yiliya.pojo.OfferServiceDetail;
import xin.yiliya.pojo.OfferServiceSimple;

import java.util.List;

@Repository
public interface OfferServiceMapper {
    int deleteByPrimaryKey(Integer offerserviceid);

    int insert(OfferService record);

    int insertSelective(OfferService record);

    OfferService selectByPrimaryKey(Integer offerserviceid);

    int updateByPrimaryKeySelective(OfferService record);

    int updateByPrimaryKey(OfferService record);

    List<OfferServiceSimple> getAllSimpleOfferServiceByStoreId(Integer storeId);

    OfferServiceDetail getOfferServiceDetailByServiceId(Integer serviceId);

    List<Cities> getCitiesByServiceId(Integer serviceId);

}
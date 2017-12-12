package xin.yiliya.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.Cities;
import xin.yiliya.pojo.OfferService;
import xin.yiliya.pojo.OfferServiceDetail;
import xin.yiliya.pojo.OfferServiceSimple;

import java.util.List;

@Repository
public interface OfferServiceMapper {

    int getServiceOfFans(Integer offerServiceId);

    int getServiceOfMarkNum(Integer offerServiceId);

    int deleteByPrimaryKey(Integer offerserviceid);

    int insert(OfferService record);

    int insertSelective(OfferService record);

    OfferService selectByPrimaryKey(Integer offerserviceid);

    int updateByPrimaryKeySelective(OfferService record);

    int updateByPrimaryKey(OfferService record);

    String getLinkByServiceId(Integer serviceId);

    List<OfferServiceSimple> getAllSimpleOfferServiceByStoreId(Integer storeId);

    OfferServiceDetail getOfferServiceDetailByServiceId(Integer serviceId);

    List<Cities> getCitiesByServiceId(Integer serviceId);

    List<OfferServiceSimple> getAllUserConcernServices(Integer userId);

    List<OfferServiceSimple> getServicesByCityAndKind(@Param(value = "kind") Integer serviceKind,@Param(value = "ciid") Integer ciid);

    List<OfferServiceSimple> getServicesByInput(@Param(value = "input") String input,@Param(value = "kind") Integer serviceKind,@Param(value = "ciid") Integer ciid);

    String[] getServiceNameByInput(@Param(value = "input") String input,@Param(value = "ciid") Integer ciid);
}
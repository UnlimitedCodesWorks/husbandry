package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.ServicePeople;

import java.util.List;

@Repository
public interface ServicePeopleMapper {
    int deleteByPrimaryKey(Integer servicepeopleid);

    int insert(ServicePeople record);

    int insertSelective(ServicePeople record);

    ServicePeople selectByPrimaryKey(Integer servicepeopleid);

    int updateByPrimaryKeySelective(ServicePeople record);

    int updateByPrimaryKey(ServicePeople record);

    List<ServicePeople> getAllServicePeopleTemplateByStoreId(Integer storeId);

    String getServicePeopleHeadImg(Integer servicePeopleId);

    ServicePeople getServicePeople(String spName);

    List<ServicePeople> getServicePeopleByOrderId(Integer orderId);
}
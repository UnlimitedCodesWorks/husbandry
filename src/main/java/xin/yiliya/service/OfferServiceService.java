package xin.yiliya.service;

import com.github.pagehelper.PageInfo;
import xin.yiliya.pojo.*;

public interface OfferServiceService {

    //添加一个服务
    //参数ifTemplate表示是否添加的是模板，true为添加模板，false为不添加
    //单纯只添加服务这里填false
    //返回：添加服务的id,若返回值为0则表示添加失败
    Integer addService(OfferServiceAdd offerServiceAdd,Boolean ifTemplate);

    //添加一个服务模板
    //返回：添加服务模板成功后的id，若返回值为0则表示添加失败
    Integer addServiceTemplate(OfferServiceTemplate offerServiceTemplate,OfferServiceAdd offerServiceAdd);

    //修改一个服务
    //返回：修改服务是否成功的布尔值
    Boolean updateService(OfferServiceUpdate offerServiceupdate);

    //删除一个服务
    //返回：删除服务是否成功的布尔值
    Boolean deleteService(Integer serviceId);

    //根据厂商id获取简单服务详情（可分页）
    //返回多个简单服务详情Bean
    PageInfo<OfferServiceSimple> getAllSimpleOfferServiceByStoreId(
            Integer storeId,int currentPage,int pageSize);

    //根据服务id获取服务详细信息
    //返回单个服务详细信息Bean
    OfferServiceDetail getOfferServiceDetailByServiceId(Integer serviceId);

}

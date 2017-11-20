package xin.yiliya.service;

import com.github.pagehelper.PageInfo;
import xin.yiliya.pojo.OfferServiceAdd;
import xin.yiliya.pojo.OfferServiceDetail;
import xin.yiliya.pojo.OfferServiceSimple;
import xin.yiliya.pojo.OfferServiceUpdate;

public interface OfferServiceService {

    //添加一个服务
    //返回：添加服务是否成功的布尔值
    Boolean addService(OfferServiceAdd offerServiceAdd);

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

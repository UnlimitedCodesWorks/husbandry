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

    //修改一个服务模板
    //返回：修改服务是否成功的布尔值
    Boolean updateServiceTemplate(
            OfferServiceTemplate offerServiceTemplate,OfferServiceUpdate offerServiceUpdate);

    //删除一个服务
    //返回：删除服务是否成功的布尔值
    //待补充的接口
    Boolean deleteService(Integer serviceId);

    //删除一个服务模板
    //返回：删除服务模板是否成功的布尔值
    Boolean deleteServiceTemplate(Integer templateId);

    //根据厂商id获取简单服务详情（可分页）
    //返回多个简单服务详情Bean
    PageInfo<OfferServiceSimple> getAllSimpleOfferServiceByStoreId(
            Integer storeId,int currentPage,int pageSize);

    //根据厂商id获取简单模板详情（可分页）
    //返回多个简单模板详情Bean
    PageInfo<OfferServiceTemplate> getAllOfferServiceTemplateByStoreId(
            Integer storeId,int currentPage,int pageSize);

    //根据服务id获取服务详细信息
    //返回单个服务详细信息Bean
    //待补充的接口
    OfferServiceDetail getOfferServiceDetailByServiceId(Integer serviceId);

    //根据模板id获取模板详细信息
    //返回单个模板详细信息Bean
    OfferServiceTemplate getOfferServiceTemplateByTemplateId(Integer templateId);


    //根据城市和所选服务类别匹配对应服务商的服务
    //参数：schema表示输入的排序模式，可输入参数为Rank.GRADE,Rank.SALES,Rank.PRICE
    // Rank.GRADE表示按评分排序，Rank.SALES表示按销量排序，Rank.PRICE表示按价格排序
    // 每个参数都有后缀DESC与ASC代表降序和升序排序,如Rank.GRADE_DESC表示按评分降序排序
    //返回多个服务简单信息Bean
    PageInfo<OfferServiceSimple> getServicesByCityAndKind(
    Integer serviceKind,Integer ciid,int schema,int currentPage,int pageSize);
}

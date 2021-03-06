package xin.yiliya.service;

import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.stereotype.Service;
import xin.yiliya.pojo.ServicePeople;
import xin.yiliya.pojo.ServicePeopleAdd;
import xin.yiliya.pojo.ServicePeopleTemp;
import xin.yiliya.pojo.ServicePeopleUpdate;

@Service
public interface ServicePeopleService {

    //派遣临时服务人员或派遣模板服务人员
    //用布尔值进行区分
    //布尔值为true,则派遣模板人员，若为false，则派遣临时人员
    public Boolean addTempServicePeople(ServicePeopleTemp servicePeopleTemp,Boolean templatePeople);

    //添加一个服务人员模板
    //返回：添加服务人员的id，若返回为0，则添加失败
    public Integer addServicePeopleTemplate(ServicePeopleAdd servicePeopleAdd);

    //获取供应商服务人员模板
    //返回服务人员模板详情bean   可分页
    public PageInfo<ServicePeople> getAllServicePeopleTemplateByStoreId(Integer storeId, int currentPage, int pageSize);

    //根据服务人员id查询单个服务人员模板bean
    public ServicePeople getServicePeopleTemplateById(Integer id);

    //删除服务人员模板
    //参数：服务人员id
    public Boolean deleteServicePeopleTemplate(Integer id);

    //修改一个服务人员模板
    //返回：修改服务人员模板是否成功的布尔值
    public Boolean updateServicePeopleTemlate(ServicePeopleUpdate servicePeopleUpdate);

    //根据订单id查找服务人员
    //返回：服务人员Bean
    public ServicePeople getDispatchPeople(Integer orderId);

    //重新派遣模板服务人员
    //返回：布尔值
    public Boolean addRestartDispatchTemplate(ServicePeopleTemp servicePeopleTemp);

}

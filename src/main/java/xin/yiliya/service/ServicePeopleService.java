package xin.yiliya.service;

import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.stereotype.Service;
import xin.yiliya.pojo.ServicePeople;
import xin.yiliya.pojo.ServicePeopleAdd;
import xin.yiliya.pojo.ServicePeopleUpdate;

@Service
public interface ServicePeopleService {

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

    //根据服务人员名字显示模板
    public ServicePeople getServicePeople(String spName);
}

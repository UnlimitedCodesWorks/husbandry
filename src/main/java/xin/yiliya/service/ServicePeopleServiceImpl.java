package xin.yiliya.service;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.OrderMapper;
import xin.yiliya.dao.OrderPeopleMapper;
import xin.yiliya.dao.ServicePeopleMapper;
import xin.yiliya.pojo.*;
import xin.yiliya.tool.AliOssTool;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class ServicePeopleServiceImpl implements ServicePeopleService{

    @Resource
    private AliOssTool aliOssTool;

    @Autowired
    ServicePeopleMapper servicePeopleMapper;

    @Autowired
    OrderPeopleMapper orderPeopleMapper;

    @Autowired
    OrderMapper orderMapper;

    public Boolean addTempServicePeople(ServicePeopleTemp servicePeopleTemp,Boolean templatePeople) {
        try{
            if(templatePeople==false){
                ServicePeople servicePeople=new ServicePeople();
                BeanUtils.copyProperties(servicePeople,servicePeopleTemp);
                servicePeople.setSpHead(aliOssTool.putImage(servicePeopleTemp.getSphead(),"other"));
                servicePeople.setUpTime(new Date());
                servicePeopleMapper.insertSelective(servicePeople);
                Integer servicePeopleId=servicePeople.getServicepeopleid();
                Integer orderId=servicePeopleTemp.getOrderId();
                OrderPeople orderPeople=new OrderPeople();
                orderPeople.setOrderId(orderId);
                orderPeople.setSpId(servicePeopleId);
                orderPeopleMapper.insertSelective(orderPeople);
                orderMapper.afterDispatchOrder(orderId);
                return true;
            }
            else{
                Integer orderId=servicePeopleTemp.getOrderId();
                Integer servicePeopleId=servicePeopleTemp.getServicepeopleid();
                OrderPeople orderPeople=new OrderPeople();
                orderPeople.setOrderId(orderId);
                orderPeople.setSpId(servicePeopleId);
                orderPeopleMapper.insertSelective(orderPeople);
                orderMapper.afterDispatchOrder(orderId);
                return true;
            }
        }catch (Exception e){
            return false;
        }
    }

    public Integer addServicePeopleTemplate(ServicePeopleAdd servicePeopleAdd) {
        try{
            ServicePeople servicePeople=new ServicePeople();
            BeanUtils.copyProperties(servicePeople,servicePeopleAdd);
            servicePeople.setSpHead(aliOssTool.putImage(servicePeopleAdd.getSphead(),"other"));
            servicePeople.setUpTime(new Date());
            servicePeopleMapper.insertSelective(servicePeople);
            return servicePeople.getServicepeopleid();
        }catch (Exception e){
            return 0;
        }
    }

    public PageInfo<ServicePeople> getAllServicePeopleTemplateByStoreId(Integer storeId,int currentPage,int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<ServicePeople> list=servicePeopleMapper.getAllServicePeopleTemplateByStoreId(storeId);
        PageInfo<ServicePeople> info=new PageInfo<ServicePeople>(list);
        return info;
    }

    public ServicePeople getServicePeopleTemplateById(Integer id) {
        ServicePeople servicePeople=servicePeopleMapper.selectByPrimaryKey(id);
        return  servicePeople;
    }

    public Boolean deleteServicePeopleTemplate(Integer id) {
        try{
            aliOssTool.deleteFileByLink(servicePeopleMapper.getServicePeopleHeadImg(id));
            servicePeopleMapper.deleteByPrimaryKey(id);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public Boolean updateServicePeopleTemlate(ServicePeopleUpdate servicePeopleUpdate) {
        try{
            ServicePeople servicePeople=new ServicePeople();
            BeanUtils.copyProperties(servicePeople,servicePeopleUpdate);
            servicePeople.setUpTime(new Date());
            if(!(servicePeopleUpdate.getSphead().isEmpty())){
                if(servicePeopleUpdate.getSpheadLink()!=null){
                    aliOssTool.deleteFileByLink(servicePeopleUpdate.getSpheadLink());
                }
                servicePeople.setSpHead(aliOssTool.putImage(servicePeopleUpdate.getSphead(),"other"));
            }
            servicePeopleMapper.updateByPrimaryKeySelective(servicePeople);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public Boolean addRestartDispatchTemplate(ServicePeopleTemp servicePeopleTemp) {
        try{
            Integer orderId=servicePeopleTemp.getOrderId();
            Integer servicePeopleId=servicePeopleTemp.getServicepeopleid();
            OrderPeople orderPeople=new OrderPeople();
            orderPeople.setSpId(servicePeopleId);
            orderPeople.setOrderId(orderId);
            orderPeopleMapper.update(orderPeople);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public ServicePeople getDispatchPeople(Integer orderId) {
        return servicePeopleMapper.getDispatchPeople(orderId);
    }

}

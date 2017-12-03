package xin.yiliya.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.beanutils.BeanUtils;
import org.omg.Messaging.SYNC_WITH_TRANSPORT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.ServicePeopleMapper;
import xin.yiliya.pojo.ServicePeople;
import xin.yiliya.pojo.ServicePeopleAdd;
import xin.yiliya.pojo.ServicePeopleUpdate;
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
            if(servicePeopleUpdate.getSphead()!=null){
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

    public ServicePeople getServicePeople(String spName) {
        return servicePeopleMapper.getServicePeople(spName);
    }
}

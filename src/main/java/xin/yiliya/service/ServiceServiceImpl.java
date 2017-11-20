package xin.yiliya.service;

import xin.yiliya.dao.ServiceMapper;
import xin.yiliya.pojo.Service;

import javax.annotation.Resource;
import java.util.List;


@org.springframework.stereotype.Service
public class ServiceServiceImpl implements ServiceService {

    @Resource
    ServiceMapper serviceMapper;
    public List<Service> getAllService() {
        return serviceMapper.getAllService();
    }
}

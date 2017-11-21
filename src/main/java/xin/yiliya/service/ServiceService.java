package xin.yiliya.service;

import xin.yiliya.pojo.Service;

import java.util.List;

public interface ServiceService {

    //获得全部服务类
    //返回：多个服务类Bean
    public List<Service> getAllService();

}

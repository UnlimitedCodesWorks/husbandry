package xin.yiliya.service;

import xin.yiliya.pojo.Service;

import java.util.List;

public interface ServiceService {

    //获得全部服务类
    //返回：多个服务类Bean
    List<Service> getAllService();

    //获取某服务类的市场价
    //返回：该服务的市场价
    float getServiceKindPrice(Integer serid);



}

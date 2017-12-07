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

    //根据服务id获取服务名
    //返回：该服务的服务名
    String getSerKindBySerId(Integer serid);

}

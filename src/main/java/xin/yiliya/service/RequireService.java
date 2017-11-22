package xin.yiliya.service;

import org.springframework.stereotype.Service;
import xin.yiliya.pojo.RequireList;

@Service
public interface RequireService {

    //确认需求表单生成订单order
    //参数：userId，serviceId(商店服务id)
    //返回：订单号(成功)，0(失败)
    public Integer addRequireOrder(Integer userId,Integer serviceId);

    //确认订单后将问题，选中的答案都插入require表
    //参数：订单号，集合绑定参数
    //返回：插入成功true，不成功false
    public Boolean addRequires(Integer orderId, RequireList requireList);

}

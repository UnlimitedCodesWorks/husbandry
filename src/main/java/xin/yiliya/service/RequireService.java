package xin.yiliya.service;

import org.springframework.stereotype.Service;
import xin.yiliya.pojo.Order;
import xin.yiliya.pojo.RequireList;

@Service
public interface RequireService {



    //确认需求表单生成订单order
    //参数：用户userId
    //返回订单id
    public Integer addRequireOrder(Integer userId,RequireList requireList);

    //确认订单后 将问题，选中的答案都插入require表
    //参数：订单id，集合绑定参数
    //返回：插入成功true，不成功false
    public Boolean addRequires(Integer orderId, RequireList requireList);

}

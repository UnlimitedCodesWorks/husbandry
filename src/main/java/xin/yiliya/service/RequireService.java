package xin.yiliya.service;

import org.springframework.stereotype.Service;
import xin.yiliya.pojo.OrderBigTime;
import xin.yiliya.pojo.Require;
import xin.yiliya.pojo.RequireList;

@Service
public interface RequireService {



//    //确认需求表单生成订单order,将问题，选中的答案插入require表中
//    //参数：用户userId，集合绑定参数
//    //返回：布尔类型:true成功，false不成功
    Boolean addRequireOrder(Integer userId, RequireList requireList, Require require, OrderBigTime orderBigTime);

}

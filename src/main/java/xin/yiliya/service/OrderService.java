package xin.yiliya.service;

import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.stereotype.Service;
import xin.yiliya.pojo.*;

import java.util.List;

@Service
public interface OrderService {

    //某服务类型服务订单完成的次数(不包括退款)
    Integer getServiceTypeFinish(int serid);

    //厂商所有服务的成交量总和(不包括退款)
    Integer getStoreServiceFinish(int storeId);

    //获取客户全部订单
    //参数：客户id    分页显示
    PageInfo<OrderShow> getAllUserOrder(Integer userId, int currentPage, int pageSize);

    //获取客户等待派遣订单
    //参数：客户id    分页显示
    PageInfo<OrderShow> getAllUserSendOrder(Integer userId, int currentPage, int pageSize);

    //获取客户等待确认订单
    //参数：客户id    分页显示
    PageInfo<OrderShow> getAllUserSureOrder(Integer userId, int currentPage, int pageSize);

    //获取客户等待评价订单
    //参数：客户id    分页显示
    PageInfo<OrderShow> getAllUserAssessOrder(Integer userId, int currentPage, int pageSize);

    //获取客户退款订单
    //参数：客户id    分页显示
    PageInfo<OrderCancel> getAllUserCancelOrder(Integer userId, int currentPage, int pageSize);

    //客户撤销订单
    //返回：布尔值
    Boolean userCancelToOrder(Cancel cancel);

    //客户查看服务进展
    PageInfo<ServicePeople> getOrderServicePeople(Integer orderId, int currentPage, int pageSize);

    //客户删除订单
    Boolean userDeleteOrder(Integer orderId);

    //客户确认订单
    Boolean userSureToOrder(int orderId);

    //获取退款理由
    String getCancelReason(Integer cancelId);

    //商户待退款订单数量
    Integer cancelCount(Integer storeId);

    //商户待处理订单数量
    Integer handleCount(Integer storeId);

    //商户待确认订单数量
    Integer sureCount(Integer storeId);

    //获取商户待处理订单
    //参数：商户id    分页显示
    PageInfo<OrderSimple> getAllStoreHandleOrder(Integer storeId, int currentPage, int pageSize);

    //获取商户待确认订单
    //参数：商户id    分页显示
    PageInfo<OrderSimple> getAllStoreSureOrder(Integer storeId, int currentPage, int pageSize);

    //获取商户待退款订单
    //参数：商户id    分页显示
    PageInfo<OrderCancel> getAllStoreCancelOrder(Integer storeId, int currentPage, int pageSize);

    //获取商户已完成订单
    //参数：商户id    分页显示
    PageInfo<OrderSimple> getAllStoreFinishOrder(Integer storeId, int currentPage, int pageSize);

    //模糊搜索,获取商户待处理订单
    //参数：输入参数input type,商户id，分页显示
    PageInfo<OrderSimple> getAllStoreHandleOrder(String input,String type,Integer storeId, int currentPage, int pageSize);

    //模糊搜索,获取商户待确认订单
    //参数：输入参数input type,商户id，分页显示
    PageInfo<OrderSimple> getAllStoreSureOrder(String input,String type,Integer storeId, int currentPage, int pageSize);

    //模糊搜索,获取商户待退款订单
    //参数：输入参数input type,商户id，分页显示
    PageInfo<OrderCancel> getAllStoreCancelOrder(String input,String type,Integer storeId, int currentPage, int pageSize);

    //模糊搜索,获取商户已完成订单
    //参数：输入参数input type,商户id，分页显示
    PageInfo<OrderSimple> getAllStoreFinishOrder(String input,String type,Integer storeId, int currentPage, int pageSize);

    //获取每个订单用户的需求
    List<Require> getUserRequires(Integer orderId);

    //商户通过客户退款
    Boolean storeSureCancelOrder(Integer orderId);

    //商户拒绝客户退款
    Boolean StoreRefuseCancelOrder(Integer orderId);

}

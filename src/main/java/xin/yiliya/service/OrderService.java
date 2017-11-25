package xin.yiliya.service;

import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.stereotype.Service;
import xin.yiliya.pojo.*;

import java.util.List;

@Service
public interface OrderService {

    //某服务类型服务订单完成的次数(不包括退款)
    public Integer getServiceTypeFinish(int serid);

    //厂商所有服务的成交量总和(不包括退款)
    public Integer getStoreServiceFinish(int storeId);

    //获取客户全部订单
    //参数：客户id    分页显示
    public PageInfo<OrderShow> getAllUserOrder(Integer userId, int currentPage, int pageSize);

    //获取客户等待派遣订单
    //参数：客户id    分页显示
    public PageInfo<OrderShow> getAllUserSendOrder(Integer userId, int currentPage, int pageSize);

    //获取客户等待确认订单
    //参数：客户id    分页显示
    public PageInfo<OrderShow> getAllUserSureOrder(Integer userId, int currentPage, int pageSize);

    //获取客户等待评价订单
    //参数：客户id    分页显示
    public PageInfo<OrderShow> getAllUserAssessOrder(Integer userId, int currentPage, int pageSize);

    //获取客户退款订单
    //参数：客户id    分页显示
    public PageInfo<OrderCancel> getAllUserCancelOrder(Integer userId, int currentPage, int pageSize);

    //获取商户待处理订单
    //参数：商户id    分页显示
    public PageInfo<OrderSimple> getAllStoreHandleOrder(Integer storeId, int currentPage, int pageSize);

    //获取商户待确认订单
    //参数：商户id    分页显示
    public PageInfo<OrderSimple> getAllStoreSureOrder(Integer storeId, int currentPage, int pageSize);

    //获取商户待退款订单
    //参数：商户id    分页显示
    public PageInfo<OrderCancel> getAllStoreCancelOrder(Integer storeId, int currentPage, int pageSize);

    //商户待退款订单数量
    public Integer cancelCount(Integer storeId);

    //商户待处理订单数量
    public Integer handleCount(Integer storeId);

    //商户待确认订单数量
    public Integer sureCount(Integer storeId);

    //获取每个订单用户的需求
    public List<Require> getUserRequires(Integer orderId);

    //客户撤销订单
    public Boolean userCancelToOrder(Cancel cancel);

    //商户批量通过客户退款
    public Boolean storeSureCancelOrder(int [] orderId);

    //客户确认订单
    public Boolean userSureToOrder(int orderId);

    //商户派遣服务人员
    public Integer dispatcheServicePeople(OrderPeople orderPeople);

}

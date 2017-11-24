package xin.yiliya.service;

import com.github.pagehelper.PageInfo;
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

    //获取每个订单用户的需求
    public List<Require> getUserRequires(Integer orderId);
}

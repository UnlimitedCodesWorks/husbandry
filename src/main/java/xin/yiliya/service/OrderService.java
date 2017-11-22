package xin.yiliya.service;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import xin.yiliya.pojo.OrderCancel;
import xin.yiliya.pojo.OrderShow;
import xin.yiliya.pojo.Order;

@Service
public interface OrderService {

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

}

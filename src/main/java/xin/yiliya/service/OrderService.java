package xin.yiliya.service;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import xin.yiliya.pojo.Order;

@Service
public interface OrderService {

    //获取客户全部订单
    public PageInfo<Order> getAllUserOrder(Integer userId,int currentPage,int pageSize);

    //获取客户等待派遣订单
    public PageInfo<Order> getAllUserSendOrder(Integer userId,int currentPage,int pageSize);

    //获取客户等待确认订单
    public PageInfo<Order> getAllUserSureOrder(Integer userId,int currentPage,int pageSize);

    //获取客户等待评价订单
    public PageInfo<Order> getAllUserAssessOrder(Integer userId,int currentPage,int pageSize);
}

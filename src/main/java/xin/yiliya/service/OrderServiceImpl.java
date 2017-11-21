package xin.yiliya.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.OrderMapper;
import xin.yiliya.pojo.Order;
import xin.yiliya.pojo.OrderCancel;
import xin.yiliya.pojo.OrderShow;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    OrderMapper orderMapper;

    public PageInfo<OrderShow> getAllUserOrder(Integer userId, int currentPage, int pageSize){
        PageHelper.startPage(currentPage,pageSize);
        List<OrderShow> list=orderMapper.getAllUserOrder(userId);
        PageInfo<OrderShow> pageInfo=new PageInfo<OrderShow>(list);
        return pageInfo;
    }

    public PageInfo<OrderShow> getAllUserSendOrder(Integer userId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<OrderShow> list = orderMapper.getAllUserSendOrder(userId);
        PageInfo<OrderShow> pageInfo=new PageInfo<OrderShow>(list);
        return pageInfo;
    }

    public PageInfo<OrderShow> getAllUserSureOrder(Integer userId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<OrderShow> list =orderMapper.getAllUserSureOrder(userId);
        PageInfo<OrderShow> pageInfo=new PageInfo<OrderShow>(list);
        return pageInfo;
    }

    public PageInfo<OrderShow> getAllUserAssessOrder(Integer userId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<OrderShow> list =orderMapper.getAllUserAssessOrder(userId);
        PageInfo<OrderShow> pageInfo=new PageInfo<OrderShow>(list);
        return pageInfo;
    }

    public PageInfo<OrderCancel> getAllUserCancelOrder(Integer userId, int currentPage, int pageSize){
        PageHelper.startPage(currentPage,pageSize);
        List<OrderCancel> list=orderMapper.getAllUserCancelOrder(userId);
        PageInfo<OrderCancel> pageInfo=new PageInfo<OrderCancel>(list);
        return pageInfo;
    }
}

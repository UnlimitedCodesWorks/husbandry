package xin.yiliya.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.OrderMapper;
import xin.yiliya.pojo.Order;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    OrderMapper orderMapper;

    public PageInfo<Order> getAllUserOrder(Integer userId,int currentPage,int pageSize){
        PageHelper.startPage(currentPage,pageSize);
        List<Order> list=orderMapper.getAllUserOrder(userId);
        PageInfo<Order> pageInfo=new PageInfo<Order>(list);
        return pageInfo;
    }

    public PageInfo<Order> getAllUserSendOrder(Integer userId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<Order> list = orderMapper.getAllUserSendOrder(userId);
        PageInfo<Order> pageInfo=new PageInfo<Order>(list);
        return pageInfo;
    }

    public PageInfo<Order> getAllUserSureOrder(Integer userId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<Order> list =orderMapper.getAllUserSureOrder(userId);
        PageInfo<Order> pageInfo=new PageInfo<Order>(list);
        return pageInfo;
    }

    public PageInfo<Order> getAllUserAssessOrder(Integer userId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<Order> list =orderMapper.getAllUserAssessOrder(userId);
        PageInfo<Order> pageInfo=new PageInfo<Order>(list);
        return pageInfo;
    }
}

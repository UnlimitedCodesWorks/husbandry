package xin.yiliya.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.OrderMapper;
import xin.yiliya.pojo.*;

import java.util.Date;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    OrderMapper orderMapper;

    public Integer getServiceTypeFinish(int serid){
        return orderMapper.getServiceTypeFinish(serid);
    }

    public Integer getStoreServiceFinish(int storeId) {
        return orderMapper.getStoreServiceFinish(storeId);
    }

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

    public PageInfo<OrderSimple> getAllStoreHandleOrder(Integer storeId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<OrderSimple> list=orderMapper.getAllStoreHandleOrder(storeId);
        PageInfo<OrderSimple> pageInfo=new PageInfo<OrderSimple>(list);
        return pageInfo;
     }

    public PageInfo<OrderSimple> getAllStoreSureOrder(Integer storeId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<OrderSimple> list=orderMapper.getAllStoreSureOrder(storeId);
        return new PageInfo<OrderSimple>(list);
    }

    public PageInfo<OrderCancel> getAllStoreCancelOrder(Integer storeId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<OrderCancel> list=orderMapper.getAllStoreCancelOrder(storeId);
        return new PageInfo<OrderCancel>(list);
    }

    public List<Require> getUserRequires(Integer orderId) {
        List<Require> requires=orderMapper.getUserRequires(orderId);
        return requires;
    }

    public Boolean userCancelToOrder(Cancel cancel) {
        try{
            cancel.setStatus(0);
            cancel.setCancelTime(new Date());
            orderMapper.addUserOrderCancel(cancel);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public Boolean storeSureCancelOrder(int[] orderId) {
        try{
            for(int id:orderId){
                orderMapper.storeUpdateCancelStatus(id);
            }
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public Boolean userSureToOrder(int orderId) {
        try{
            orderMapper.userSureToOrder(orderId);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}

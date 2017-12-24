package xin.yiliya.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.OrderMapper;
import xin.yiliya.dao.OrderPeopleMapper;
import xin.yiliya.dao.ServicePeopleMapper;
import xin.yiliya.pojo.*;

import java.util.Date;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    OrderMapper orderMapper;

    @Autowired
    OrderPeopleMapper orderPeopleMapper;

    @Autowired
    ServicePeopleMapper servicePeopleMapper;

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

    public Boolean userCancelToOrder(Cancel cancel) {
        try{
            Order order=orderMapper.getOrderByOrderId(cancel.getOrderId());
            order.setStatus(3);
            cancel.setCancelTime(new Date());
            orderMapper.addUserOrderCancel(cancel);
            orderMapper.updateOrder(order);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public PageInfo<ServicePeople> getOrderServicePeople(Integer orderId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<ServicePeople> list=servicePeopleMapper.getServicePeopleByOrderId(orderId);
        return new PageInfo<ServicePeople>(list);
    }

    public Boolean userDeleteOrder(Integer orderId) {
        try{
            orderMapper.userDeleteOrder(orderId);
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

    public String getCancelReason(Integer cancelId) {
        return orderMapper.getCancelReason(cancelId);
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

    public PageInfo<OrderSimple> getAllStoreFinishOrder(Integer storeId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<OrderSimple> list=orderMapper.getAllStoreFinishOrder(storeId);
        return new PageInfo<OrderSimple>(list);
    }

    public PageInfo<OrderSimple> getAllStoreHandleOrder(String input, String type, Integer storeId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        if(type.equals("按订单号搜索")){
            List<OrderSimple> list=orderMapper.getAllStoreHandleByNumberSearch(input,storeId);
            return new PageInfo<OrderSimple>(list);
        }
        else{
            List<OrderSimple> list=orderMapper.getAllStoreHandleByUserSearch(input,storeId);
            return new PageInfo<OrderSimple>(list);
        }
    }

    public PageInfo<OrderSimple> getAllStoreSureOrder(String input, String type, Integer storeId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        if(type.equals("按订单号搜索")){
            List<OrderSimple> list=orderMapper.getAllStoreSureByNumberSearch(input,storeId);
            return new PageInfo<OrderSimple>(list);
        }
        else{
            List<OrderSimple> list=orderMapper.getAllStoreSureByUserSearch(input,storeId);
            return new PageInfo<OrderSimple>(list);
        }
    }

    public PageInfo<OrderCancel> getAllStoreCancelOrder(String input, String type, Integer storeId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        if(type.equals("按订单号搜索")){
            List<OrderCancel> list=orderMapper.getAllStoreCancelByNumberSearch(input,storeId);
            return new PageInfo<OrderCancel>(list);
        }
        else{
            List<OrderCancel> list=orderMapper.getAllStoreCancelByUserSearch(input,storeId);
            return new PageInfo<OrderCancel>(list);
        }
    }

    public PageInfo<OrderSimple> getAllStoreFinishOrder(String input, String type, Integer storeId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        if(type.equals("按订单号搜索")){
            List<OrderSimple> list=orderMapper.getAllStoreFinishByNumberSearch(input,storeId);
            return new PageInfo<OrderSimple>(list);
        }
        else{
            List<OrderSimple> list=orderMapper.getAllStoreFinishByUserSearch(input,storeId);
            return new PageInfo<OrderSimple>(list);
        }
    }

    public List<Require> getUserRequires(Integer orderId) {
        List<Require> requires=orderMapper.getUserRequires(orderId);
        return requires;
    }

    public Boolean storeSureCancelOrder(Integer orderId) {
        try{
            orderMapper.storeUpdateOrderCancelStatus(orderId);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public Boolean StoreRefuseCancelOrder(Integer orderId) {
        try{
            orderMapper.storeCancelRefuseStatus(orderId);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public Integer cancelCount(Integer storeId) {
        return orderMapper.cancelCount(storeId);
    }

    public Integer handleCount(Integer storeId) {
        return orderMapper.handleCount(storeId);
    }

    public Integer sureCount(Integer storeId) {
        return orderMapper.sureCount(storeId);
    }

    public Integer dispatchServicePeople(OrderPeople orderPeople) {
        Order order=orderMapper.getOrderByOrderId(orderPeople.getOrderId());
        order.setStatus(1);
        order.setEndTime(new Date());
        orderMapper.updateOrder(order);
        orderPeopleMapper.insertSelective(orderPeople);
        return orderPeople.getOrderpeopleid();
    }
}

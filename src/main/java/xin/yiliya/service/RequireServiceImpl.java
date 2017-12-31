package xin.yiliya.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.OrderBigTimeMapper;
import xin.yiliya.dao.OrderSmallTimeMapper;
import xin.yiliya.dao.RequireMapper;
import xin.yiliya.pojo.*;

import java.util.Date;
import java.util.List;

@Service
public class RequireServiceImpl implements RequireService{

    @Autowired
    RequireMapper requireMapper;

    @Autowired
    OrderBigTimeMapper orderBigTimeMapper;

    @Autowired
    OrderSmallTimeMapper orderSmallTimeMapper;

    public Boolean addRequireOrder(Integer userId, RequireList requireList, Require require, OrderBigTime orderBigTime){
        try{
            Order order=new Order();
            order.setOrderNumber(String.valueOf(System.currentTimeMillis())+String.valueOf((int)(Math.random()*900)+100));
            Integer serviceId=requireList.getServiceId();
            order.setServiceId(serviceId);
            order.setUserId(userId);
            order.setStatus(0);
            order.setStartTime(new Date());
            order.setEndTime(new Date());
            requireMapper.addRequireOrder(order);
            Integer orderId=order.getOrderid();
            orderBigTime.setOrderId(orderId);
            List<Require> requires=requireList.getRequireList();
            List<RequireContent> contents=require.getRequireContents();
            List<OrderSmallTime> smallTimes=orderBigTime.getOrderSmallTimeList();
            for(int i=0;i<requires.size();i++){
                Require rx=requires.get(i);
                rx.setOrderId(orderId);
                requireMapper.addRequire(rx);
                int requireId=rx.getRequireid();
                RequireContent cx=contents.get(i);
                cx.setRequireId(requireId);
                requireMapper.addContent(cx);
            }
            orderBigTimeMapper.insertSelective(orderBigTime);
            Integer priceId=orderBigTime.getOrderpriceid();
            for(int j=0;j<smallTimes.size();j++){
                OrderSmallTime ox=smallTimes.get(j);
                ox.setOrderbigtimeId(priceId);
                orderSmallTimeMapper.insertSelective(ox);
            }
            return true;
        }catch (Exception e){
            return false;
        }
    }
}

package xin.yiliya.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.RequireMapper;
import xin.yiliya.pojo.Order;
import xin.yiliya.pojo.Require;
import xin.yiliya.pojo.RequireContent;
import xin.yiliya.pojo.RequireList;

import java.util.Date;
import java.util.List;

@Service
public class RequireServiceImpl implements RequireService{

    @Autowired
    RequireMapper requireMapper;

    public Integer addRequireOrder(Integer userId, Integer serviceId) {
        try {
            Order order=new Order();
            order.setOrderNumber(String.valueOf(System.currentTimeMillis())+String.valueOf((int)(Math.random()*900)+100));
            order.setServiceId(serviceId);
            order.setUserId(userId);
            order.setStatus(0);
            order.setStartTime(new Date());
            requireMapper.addRequireOrder(order);
            return order.getOrderid();
        }catch (Exception e){
            return 0;
        }
    }

    public Boolean addRequires(Integer orderId, RequireList requireList) {
        try{
            List<Require> requires=requireList.getRequireList();
            for(Require require:requires){
                require.setOrderId(orderId);
                requireMapper.addRequire(require);
                int id=requireMapper.selectRequireIdByOrderIdAndProblem(require.getOrderId(),require.getProblem());
                List<RequireContent> contents=require.getRequireContents();
                for(RequireContent content:contents){
                    content.setRequireId(id);
                    requireMapper.addContent(content);
                }
            }
            return true;
        }catch (Exception e){
            return false;
        }
    }
}

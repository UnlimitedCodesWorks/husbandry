package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.Order;
import xin.yiliya.pojo.OrderCancel;
import xin.yiliya.pojo.OrderShow;

import java.util.List;

@Repository
public interface OrderMapper {

    List<OrderShow> getAllUserOrder(Integer userId);

    List<OrderShow> getAllUserSendOrder(Integer userId);

    List<OrderShow> getAllUserSureOrder(Integer userId);

    List<OrderShow> getAllUserAssessOrder(Integer userId);

    List<OrderCancel> getAllUserCancelOrder(Integer userId);

}

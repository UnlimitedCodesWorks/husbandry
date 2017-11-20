package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.Order;

import java.util.List;

@Repository
public interface OrderMapper {

    List<Order> getAllUserOrder(Integer userId);

    List<Order> getAllUserSendOrder(Integer userId);

    List<Order> getAllUserSureOrder(Integer userId);

    List<Order> getAllUserAssessOrder(Integer userId);

}

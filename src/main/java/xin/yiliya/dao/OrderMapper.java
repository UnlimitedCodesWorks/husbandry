package xin.yiliya.dao;

import org.apache.ibatis.annotations.Param;
import org.aspectj.weaver.ast.Or;
import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.*;

import java.util.List;

@Repository
public interface OrderMapper {

    Integer getServiceTypeFinish(int serid);

    Integer getStoreServiceFinish(int storeId);

    List<OrderShow> getAllUserOrder(Integer userId);

    List<OrderShow> getAllUserSendOrder(Integer userId);

    List<OrderShow> getAllUserSureOrder(Integer userId);

    List<OrderShow> getAllUserAssessOrder(Integer userId);

    List<OrderCancel> getAllUserCancelOrder(Integer userId);

    List<OrderSimple> getAllStoreHandleOrder(Integer storeId);

    List<OrderSimple> getAllStoreSureOrder(Integer storeId);

    List<OrderCancel> getAllStoreCancelOrder(Integer storeId);

    List<OrderSimple> getAllStoreFinishOrder(Integer storeId);

    List<Require> getUserRequires(Integer orderId);

    Integer addUserOrderCancel(Cancel cancel);

    Integer storeUpdateOrderCancelStatus(int orderId);

    Integer userSureToOrder(int orderId);

    Integer cancelCount(int storeId);

    Integer handleCount(int storeId);

    Integer sureCount(int storeId);

    Order getOrderByOrderId(Integer orderId);

    Integer updateOrder(Order order);

    Integer userDeleteOrder(Integer orderId);

    Integer updateOrderDone(@Param(value = "serviceId") Integer serviceId,@Param(value = "userId") Integer userId);
}

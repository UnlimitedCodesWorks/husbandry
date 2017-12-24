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

    List<OrderSimple> getAllStoreHandleByNumberSearch(@Param(value="input")String input,
                                                @Param(value = "storeId") Integer storeId);

    List<OrderSimple> getAllStoreHandleByUserSearch(@Param(value="input")String input,
                                                      @Param(value = "storeId") Integer storeId);

    List<OrderSimple> getAllStoreSureByNumberSearch(@Param(value="input")String input,
                                              @Param(value="storeId") Integer storeId);

    List<OrderSimple> getAllStoreSureByUserSearch(@Param(value="input")String input,
                                                    @Param(value="storeId") Integer storeId);

    List<OrderCancel> getAllStoreCancelByNumberSearch(@Param(value="input")String input,
                                                @Param(value="storeId") Integer storeId);

    List<OrderCancel> getAllStoreCancelByUserSearch(@Param(value="input")String input,
                                                      @Param(value="storeId") Integer storeId);

    List<OrderSimple> getAllStoreFinishByNumberSearch(@Param(value="input")String input,
                                                @Param(value="storeId") Integer storeId);

    List<OrderSimple> getAllStoreFinishByUserSearch(@Param(value="input")String input,
                                                      @Param(value="storeId") Integer storeId);

    List<Require> getUserRequires(Integer orderId);

    Integer addUserOrderCancel(Cancel cancel);

    Integer storeUpdateOrderCancelStatus(int orderId);

    Integer storeCancelRefuseStatus(int orderId);

    Integer userSureToOrder(int orderId);

    Integer cancelCount(int storeId);

    Integer handleCount(int storeId);

    Integer sureCount(int storeId);

    Order getOrderByOrderId(Integer orderId);

    Integer updateOrder(Order order);

    Integer userDeleteOrder(Integer orderId);

    Integer updateOrderDone(@Param(value = "serviceId") Integer serviceId,@Param(value = "userId") Integer userId);

    String getCancelReason(Integer cancelId);

    Integer afterDispatchOrder(int orderId);
}

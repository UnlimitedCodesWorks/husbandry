package xin.yiliya.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.Order;
import xin.yiliya.pojo.Require;
import xin.yiliya.pojo.RequireContent;

@Repository
public interface RequireMapper {

    Integer addRequireOrder(Order order);

    Integer addRequire(Require require);

    Integer selectRequireIdByOrderIdAndProblem(@Param("orderid") Integer orderId, @Param("pro") String problem);

    Integer addContent(RequireContent requireContent);

}

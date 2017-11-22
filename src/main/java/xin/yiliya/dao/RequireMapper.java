package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.Order;
import xin.yiliya.pojo.Require;

@Repository
public interface RequireMapper {

    Integer addRequireOrder(Order order);

    Integer addRequire(Require require);

}

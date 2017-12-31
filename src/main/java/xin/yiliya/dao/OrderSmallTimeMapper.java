package xin.yiliya.dao;

import xin.yiliya.pojo.OrderSmallTime;

public interface OrderSmallTimeMapper {
    int deleteByPrimaryKey(Integer ordertimeid);

    int insert(OrderSmallTime record);

    int insertSelective(OrderSmallTime record);

    OrderSmallTime selectByPrimaryKey(Integer ordertimeid);

    int updateByPrimaryKeySelective(OrderSmallTime record);

    int updateByPrimaryKey(OrderSmallTime record);
}
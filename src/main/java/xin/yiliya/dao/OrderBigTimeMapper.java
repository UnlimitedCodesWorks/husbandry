package xin.yiliya.dao;

import xin.yiliya.pojo.OrderBigTime;

public interface OrderBigTimeMapper {
    int deleteByPrimaryKey(Integer orderpriceid);

    int insert(OrderBigTime record);

    int insertSelective(OrderBigTime record);

    OrderBigTime selectByPrimaryKey(Integer orderpriceid);

    int updateByPrimaryKeySelective(OrderBigTime record);

    int updateByPrimaryKey(OrderBigTime record);
}
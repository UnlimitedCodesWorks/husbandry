package xin.yiliya.dao;

import xin.yiliya.pojo.OrderPeople;

public interface OrderPeopleMapper {
    int deleteByPrimaryKey(Integer orderpeopleid);

    int insert(OrderPeople record);

    int insertSelective(OrderPeople record);

    OrderPeople selectByPrimaryKey(Integer orderpeopleid);

    int updateByPrimaryKeySelective(OrderPeople record);

    int updateByPrimaryKey(OrderPeople record);

    int update(OrderPeople orderPeople);
}
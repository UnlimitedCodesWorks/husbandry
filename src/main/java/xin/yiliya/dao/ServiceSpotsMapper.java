package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.ServiceSpotsKey;

@Repository
public interface ServiceSpotsMapper {
    int deleteByPrimaryKey(ServiceSpotsKey key);

    int insert(ServiceSpotsKey record);

    int insertSelective(ServiceSpotsKey record);
}
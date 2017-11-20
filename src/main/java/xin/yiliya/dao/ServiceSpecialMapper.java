package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.ServiceSpecial;

@Repository
public interface ServiceSpecialMapper {
    int deleteByPrimaryKey(Integer spid);

    int insert(ServiceSpecial record);

    int insertSelective(ServiceSpecial record);

    ServiceSpecial selectByPrimaryKey(Integer spid);

    int updateByPrimaryKeySelective(ServiceSpecial record);

    int updateByPrimaryKey(ServiceSpecial record);
}
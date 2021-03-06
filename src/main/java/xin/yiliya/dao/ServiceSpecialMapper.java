package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.ServiceSpecial;

import java.util.List;

@Repository
public interface ServiceSpecialMapper {
    int deleteByPrimaryKey(Integer spid);

    int deleteByLink(String link);

    int deleteByServiceId(Integer serviceId);

    int insert(ServiceSpecial record);

    int insertSelective(ServiceSpecial record);

    ServiceSpecial selectByPrimaryKey(Integer spid);

    int updateByPrimaryKeySelective(ServiceSpecial record);

    int updateByPrimaryKey(ServiceSpecial record);

    List<String> getLinksByServiceId(Integer serviceId);
}
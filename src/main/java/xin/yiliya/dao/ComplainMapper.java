package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.Complain;
import xin.yiliya.pojo.ComplainSimple;

import java.util.List;

@Repository
public interface ComplainMapper {
    int deleteByPrimaryKey(Integer complainid);

    int deleteByserviceId(Integer serviceId);

    int insert(Complain record);

    int insertSelective(Complain record);

    List<ComplainSimple> getAllComplainByStoreId(Integer storeId);

    int getUnreadNumByStoreId(Integer storeId);

    int updateReadStautsById(Integer complainId);

}
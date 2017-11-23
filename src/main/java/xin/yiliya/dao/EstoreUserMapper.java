package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.EstoreUser;

import java.util.List;

@Repository
public interface EstoreUserMapper {
    int deleteByPrimaryKey(Integer estoreuserid);

    int deleteByEStoreId(Integer estoreId);

    List<EstoreUser> getAllEstoreUserByEstoreId(Integer estoreId);

    int insert(EstoreUser record);

    int insertSelective(EstoreUser record);
}
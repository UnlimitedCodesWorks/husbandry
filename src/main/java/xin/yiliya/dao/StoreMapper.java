package xin.yiliya.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.Store;

@Repository
public interface StoreMapper {
    int deleteByPrimaryKey(Integer storeid);

    int insert(Store record);

    int insertSelective(Store record);

    Store selectByPrimaryKey(Integer storeid);
    
    Store selectAllByLogin(@Param(value = "loginName") String loginName,@Param(value = "password") String password);

    Integer selectIdByRegistNum(String RegistNum);

    int updateByPrimaryKeySelective(Store record);

    int updateByPrimaryKey(Store record);
}
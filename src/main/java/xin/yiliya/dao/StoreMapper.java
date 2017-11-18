package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.Store;

@Repository
public interface StoreMapper {
    int deleteByPrimaryKey(Integer storeid);

    int insert(Store record);

    int insertSelective(Store record);

    Store selectByPrimaryKey(Integer storeid);

    Integer selectIdByRegistNum(String RegistNum);

    int updateByPrimaryKeySelective(Store record);

    int updateByPrimaryKey(Store record);
}
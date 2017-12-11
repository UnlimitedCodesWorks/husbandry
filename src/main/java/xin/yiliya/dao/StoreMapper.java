package xin.yiliya.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.Store;
import xin.yiliya.pojo.StoreIndex;
import xin.yiliya.pojo.StoreInfo;
import xin.yiliya.pojo.StoreSimple;

import java.util.List;

@Repository
public interface StoreMapper {
    int deleteByPrimaryKey(Integer storeid);

    int insert(Store record);

    int insertSelective(Store record);

    StoreInfo selectByPrimaryKey(Integer storeid);
    
    Store selectAllByLogin(@Param(value = "loginName") String loginName,@Param(value = "password") String password);

    Store selectStoreInfo(String loginName);

    Integer selectIdByRegistNum(String RegistNum);

    int updateByPrimaryKeySelective(Store record);

    int updateByPrimaryKey(Store record);

    StoreSimple selectStoreSimpleByStoreId(Integer storeId);

    List<StoreInfo> getAllUserConcernStores(Integer userId);

    List<StoreIndex> getAllHotStore();

    Integer getFansByStoreId(Integer storeId);

}
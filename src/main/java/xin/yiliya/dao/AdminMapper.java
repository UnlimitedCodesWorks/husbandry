package xin.yiliya.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.Admin;
import xin.yiliya.pojo.OfferServiceAdmin;
import xin.yiliya.pojo.StoreAdmin;

import java.util.List;

@Repository
public interface AdminMapper {
    int deleteByPrimaryKey(Integer adminid);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer adminid);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

    Admin AdminLogin(@Param("num") String adminNum,@Param("pass") String adminPass);

    int getUserNum();

    int getStoreNum();

    int getUnpassStoreNum();

    int getPassStoreNum();

    int getOrderNumPerMonth(@Param(value = "startTime") String startTime,@Param(value = "endTime") String endTime);

    List<StoreAdmin> getUnpassStores();

    List<StoreAdmin> getPassStores();

    List<StoreAdmin> getPassStoresBySearch(@Param(value = "input") String input);

    List<StoreAdmin> getUnpassStoresBySearch(@Param(value = "input") String input);

    int passStore(Integer storeId);

    int cancelStore(Integer storeId);

    String[] getAptitudeByStoreId(Integer storeId);

    List<OfferServiceAdmin> getUnpassServices();

    List<OfferServiceAdmin> getUnpassServicesBySearch(@Param(value = "input") String input);

}
package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.StoreNews;

import java.util.List;

@Repository
public interface StoreNewsMapper {
    int deleteByPrimaryKey(Integer storenewsid);

    int insert(StoreNews record);

    int insertSelective(StoreNews record);

    List<StoreNews> getAllNewsByStoreId(Integer storeId);

    int updateReadStautsById(Integer storeNewsId);

    int getUnreadNumByStoreId(Integer storeId);
}
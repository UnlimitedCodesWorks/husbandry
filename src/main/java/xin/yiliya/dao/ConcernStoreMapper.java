package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.ConcernStore;
import xin.yiliya.pojo.ConcernStoreKey;

@Repository
public interface ConcernStoreMapper {
    int deleteByPrimaryKey(ConcernStoreKey key);

    int insert(ConcernStore record);

    int insertSelective(ConcernStore record);

    int concernStoreJudgement(ConcernStoreKey key);
}
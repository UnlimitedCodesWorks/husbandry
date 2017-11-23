package xin.yiliya.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.EvaluateStore;

import java.util.List;

@Repository
public interface EvaluateStoreMapper {
    int deleteByPrimaryKey(Integer evaluatestoreid);

    int updatePraisePlusById(Integer evaluateId);

    int updatePraiseMinusById(Integer evaluateId);

    List<EvaluateStore> getAllEvaluateByStoreId(Integer storeId);

    int insert(EvaluateStore record);

    int insertSelective(EvaluateStore record);

    float getGradeByStoreId(Integer storeId);

    float getGradePerDayByStoreId(
            @Param(value = "storeId") Integer storeId, @Param(value = "startTime") String startTime,
            @Param(value = "endTime") String endTime);
}
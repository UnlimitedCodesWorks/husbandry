package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.EvaluateService;

import java.util.List;

@Repository
public interface EvaluateServiceMapper {
    int deleteByPrimaryKey(Integer evaluateserviceid);

    int deleteByServiceIdCascade(Integer serviceId);

    int deleteByServiceId(Integer serviceId);

    int insert(EvaluateService record);

    int insertSelective(EvaluateService record);

    List<EvaluateService> getAllEvaluateByServiceId(Integer serviceId);


    int updatePraisePlusById(Integer evaluateId);

    int updatePraiseMinusById(Integer evaluateId);

    float getGradeByServiceId(Integer serviceId);
}
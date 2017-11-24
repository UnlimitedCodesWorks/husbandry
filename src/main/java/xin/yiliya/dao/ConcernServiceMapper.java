package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.ConcernService;
import xin.yiliya.pojo.ConcernServiceKey;

@Repository
public interface ConcernServiceMapper {
    int deleteByPrimaryKey(ConcernServiceKey key);

    int insert(ConcernService record);

    int insertSelective(ConcernService record);

    int concernServiceJudgement(ConcernServiceKey key);
}
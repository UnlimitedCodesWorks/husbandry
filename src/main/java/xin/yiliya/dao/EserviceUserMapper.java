package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.EserviceUser;

import java.util.List;

@Repository
public interface EserviceUserMapper {
    int deleteByPrimaryKey(Integer eserviceuserid);

    int deleteByEserviceId(Integer eserviceid);

    int insert(EserviceUser record);

    int insertSelective(EserviceUser record);

    List<EserviceUser> getAllReplyByEvaluateId(Integer evaluateId);

}
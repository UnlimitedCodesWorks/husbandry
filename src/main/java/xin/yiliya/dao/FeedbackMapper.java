package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.Feedback;
import xin.yiliya.pojo.FeedbackSimple;

import java.util.List;

@Repository
public interface FeedbackMapper {
    int deleteByPrimaryKey(Integer feedbackid);

    int deleteByServiceId(Integer serviceId);

    int insert(Feedback record);

    int insertSelective(Feedback record);

    List<FeedbackSimple> getAllFeedbackByUserId(Integer userId);

    int updateReadStautsById(Integer feedbackId);

    int getUnreadNumByUserId(Integer userId);
}
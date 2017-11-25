package xin.yiliya.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.FeedbackMapper;
import xin.yiliya.pojo.Feedback;
import xin.yiliya.pojo.FeedbackSimple;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class FeedbackServiceImpl implements FeedbackService {

    @Resource
    private FeedbackMapper feedbackMapper;

    public Integer feedbackUser(Feedback feedback) {
        try {
            feedback.setTime(new Date());
            feedback.setUserRead(0);
            feedbackMapper.insertSelective(feedback);
            return feedback.getFeedbackid();
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    public PageInfo<FeedbackSimple> getAllFeedbackByUserId(Integer userId,int currentPage,int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<FeedbackSimple> list = feedbackMapper.getAllFeedbackByUserId(userId);
        for(FeedbackSimple feedbackSimple : list){
            feedbackMapper.updateReadStautsById(feedbackSimple.getFeedbackid());
        }
        return new PageInfo<FeedbackSimple>(list);
    }

    public Boolean deleteFeedbackById(Integer feedbackId) {
        try{
            feedbackMapper.deleteByPrimaryKey(feedbackId);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public Integer getUnreadNumByUserId(Integer userId) {
        return feedbackMapper.getUnreadNumByUserId(userId);
    }
}

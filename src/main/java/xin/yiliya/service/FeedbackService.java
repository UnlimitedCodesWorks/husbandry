package xin.yiliya.service;

import com.github.pagehelper.PageInfo;
import xin.yiliya.pojo.Feedback;
import xin.yiliya.pojo.FeedbackSimple;

public interface FeedbackService {

    //反馈用户
    //返回：反馈成功后的投诉信息id，若返回0则为反馈失败
    Integer feedbackUser(Feedback feedback);

    //用户查看反馈列表
    //返回多个反馈简单详情bean
    PageInfo<FeedbackSimple> getAllFeedbackByUserId(Integer userId,int currentPage,int pageSize);

    //用户删除一个反馈
    //返回：反馈是否删除成功的布尔值
    Boolean deleteFeedbackById(Integer feedbackId);

    //获取用户未查看反馈数
    //返回：用户未查看的反馈数
    Integer getUnreadNumByUserId(Integer userId);

}

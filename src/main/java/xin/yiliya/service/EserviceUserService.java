package xin.yiliya.service;

import com.github.pagehelper.PageInfo;
import xin.yiliya.pojo.EserviceUser;
import xin.yiliya.pojo.EstoreUser;

public interface EserviceUserService {

    //为服务评论添加一个回复
    //返回：回复的主键，若为0则表示插入失败
    Integer reply(EserviceUser eserviceUser);

    //删除一个回复
    //返回：回复是否成功删除的布尔值
    Boolean deleteReplyById(Integer replyId);

    //列出服务下某评论的子回复,默认按时间排序
    //返回: 多个评论集合
    PageInfo<EserviceUser> getAllReplyByEvaluateId(
            Integer evaluateId,int currentPage,int pageSize);

}

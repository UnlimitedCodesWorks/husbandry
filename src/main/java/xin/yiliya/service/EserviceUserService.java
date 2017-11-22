package xin.yiliya.service;

import xin.yiliya.pojo.EserviceUser;

public interface EserviceUserService {

    //为服务评论添加一个回复
    //返回：回复的主键，若为0则表示插入失败
    Integer reply(EserviceUser eserviceUser);

    //删除一个回复
    //返回：回复是否成功删除的布尔值
    Boolean deleteReplyById(Integer replyId);

}

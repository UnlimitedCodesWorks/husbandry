package xin.yiliya.service;

import com.github.pagehelper.PageInfo;
import xin.yiliya.pojo.Complain;
import xin.yiliya.pojo.ComplainSimple;

public interface ComplainService {

    //投诉一个商家服务
    //返回：投诉成功后的投诉信息id，若返回0则为投诉失败
    Integer complainStore(Complain complain);

    //商家查看投诉列表
    //返回多个反馈简单详情bean
    PageInfo<ComplainSimple> getAllComplainByStoreId(Integer storeId,int currentPage,int pageSize);

    //商家删除一个投诉
    //返回：删除投诉是否成功的布尔值
    Boolean deleteComplainById(Integer complainId);

    //获取商家未查看的投诉数
    //返回：商家未查看的投诉数
    Integer getUnreadNumByStoreId(Integer storeId);

}

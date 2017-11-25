package xin.yiliya.service;

import com.github.pagehelper.PageInfo;
import xin.yiliya.pojo.StoreNews;

public interface StoreNewsService {

    //向厂商添加一条消息
    //返回：消息的id，若添加失败则返回0
    Integer addNew(StoreNews storeNews);

    //删除一条消息
    //返回：删除消息是否成功的布尔值
    Boolean deleteNewById(Integer storeNewId);

    //获取该厂商下的所有消息
    //返回多个厂商消息bean
    PageInfo<StoreNews> getAllNewsByStoreId(Integer storeId,int currentPage,int pageSize);

    //获取该厂商下所有未读消息的数量
    Integer getUnreadNumByStoreId(Integer storeId);
}

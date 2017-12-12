package xin.yiliya.service;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import xin.yiliya.pojo.*;

@Service
public interface UserConcernService {

    //获取客户关注的服务
    //参数：客户id     可分页
     PageInfo<OfferServiceSimple> userConcernServices(Integer userId, int currentPage, int pageSize);

    //获取客户关注的供应商
    //参数：客户id     可分页
     PageInfo<StoreIndex> userConcernStores(Integer userId,int currentPage, int pageSize);

    //判断用户是否关注了该服务
    Boolean concernServiceJudgement(ConcernServiceKey key);

    //判断用户是否关注了该厂商
    Boolean concernStoreJudgement(ConcernStoreKey key);

    //用户关注该服务
    Boolean concernService(ConcernService concernService);

    //用户关注该厂商
    Boolean concernStore(ConcernStore concernStore);

    //用户取消关注该服务
    Boolean unconcernService(ConcernServiceKey key);

    //用户取消关注该厂商
    Boolean unconcernStore(ConcernStoreKey key);


}

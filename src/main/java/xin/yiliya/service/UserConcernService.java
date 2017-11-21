package xin.yiliya.service;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import xin.yiliya.pojo.OfferServiceSimple;
import xin.yiliya.pojo.StoreInfo;

@Service
public interface UserConcernService {

    //获取客户关注的服务
    //参数：客户id     可分页
    public PageInfo<OfferServiceSimple> userConcernServices(Integer userId, int currentPage, int pageSize);

    //获取客户关注的供应商
    //参数：客户id     可分页
    public PageInfo<StoreInfo> userConcernStores(Integer userId,int currentPage, int pageSize);
}

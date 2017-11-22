package xin.yiliya.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.OfferServiceMapper;
import xin.yiliya.dao.StoreMapper;
import xin.yiliya.pojo.OfferServiceSimple;
import xin.yiliya.pojo.StoreInfo;

import java.util.List;

@Service
public class UserConcernServiceImpl implements UserConcernService{

    @Autowired
    OfferServiceMapper offerServiceMapper;

    @Autowired
    StoreMapper storeMapper;

    public PageInfo<OfferServiceSimple> userConcernServices(Integer userId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<OfferServiceSimple> list=offerServiceMapper.getAllUserConcernServices(userId);
        PageInfo<OfferServiceSimple> info=new PageInfo<OfferServiceSimple>(list);
        return info;
    }

    public PageInfo<StoreInfo> userConcernStores(Integer userId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<StoreInfo> list=storeMapper.getAllUserConcernStores(userId);
        PageInfo<StoreInfo> info=new PageInfo<StoreInfo>(list);
        return info;
    }
}

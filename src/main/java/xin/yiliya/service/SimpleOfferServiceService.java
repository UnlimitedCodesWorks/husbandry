package xin.yiliya.service;

import com.github.pagehelper.PageInfo;
import xin.yiliya.pojo.SimpleOfferService;

public interface SimpleOfferServiceService {

    public PageInfo<SimpleOfferService> getAllSimpleOfferServiceByStoreId(
            Integer storeId,int currentPage,int pageSize);
}

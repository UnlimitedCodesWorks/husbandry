package xin.yiliya.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.SimpleOfferServiceMapper;
import xin.yiliya.pojo.SimpleOfferService;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SimpleOfferServiceServiceImpl implements SimpleOfferServiceService {

    @Resource
    SimpleOfferServiceMapper simpleOfferServiceMapper;

    public PageInfo<SimpleOfferService> getAllSimpleOfferServiceByStoreId(
            Integer storeId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<SimpleOfferService> list = simpleOfferServiceMapper.getAllSimpleOfferServiceByStoreId(storeId);
        PageInfo<SimpleOfferService> pageInfo = new PageInfo<SimpleOfferService>(list);
        return pageInfo;
    }
}

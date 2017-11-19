package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.SimpleOfferService;

import java.util.List;

@Repository
public interface SimpleOfferServiceMapper {

    public List<SimpleOfferService> getAllSimpleOfferServiceByStoreId(Integer storeId);

}

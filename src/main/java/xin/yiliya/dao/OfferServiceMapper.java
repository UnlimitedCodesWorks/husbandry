package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.OfferService;

@Repository
public interface OfferServiceMapper {
    int deleteByPrimaryKey(Integer offerserviceid);

    int insert(OfferService record);

    int insertSelective(OfferService record);

    OfferService selectByPrimaryKey(Integer offerserviceid);

    int updateByPrimaryKeySelective(OfferService record);

    int updateByPrimaryKey(OfferService record);

    Integer selectIdByName(String name);
}
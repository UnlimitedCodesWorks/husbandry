package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.Aptitude;

@Repository
public interface AptitudeMapper {
    int deleteByPrimaryKey(Integer aptitudeid);

    int insert(Aptitude record);

    int insertSelective(Aptitude record);

    Aptitude selectByPrimaryKey(Integer aptitudeid);

    int updateByPrimaryKeySelective(Aptitude record);

    int updateByPrimaryKey(Aptitude record);
}
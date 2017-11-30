package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.Cities;

import java.util.List;

@Repository
public interface CitiesMapper {

    List<Cities> selectAllCitiesByProvince(String provinceId);

    List<Cities> selectAllCities();

    Integer selectCiidByCityId(String CityId);
}
package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.Cities;

import java.util.List;

@Repository
public interface CitiesMapper {

    public List<Cities> selectAllCitiesByProvince(String provinceId);

    public List<Cities> selectAllCities();

    public Integer selectCiidByCityId(String CityId);
}
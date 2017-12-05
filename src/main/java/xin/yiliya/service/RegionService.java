package xin.yiliya.service;

import xin.yiliya.pojo.Areas;
import xin.yiliya.pojo.Cities;

import java.util.List;
import java.util.Map;

public interface RegionService {

    //获取所有省级
     Map<String,String> getAllProvinces();
    //获取所有市级
     List<Cities> getAllCitiesByProvince(String provinceId);
    //获取所有地区
     List<Areas> getAllAreasByCity(String cityId);
     //根据市级长id获取短id
     Integer selectCiidByCityId(String CityId);
     //根据区级长id获取短id
     Integer selectAridByAreaId(String areaId);

}

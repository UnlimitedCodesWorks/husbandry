package xin.yiliya.service;

import java.util.Map;

public interface RegionService {

    //获取所有省级
     Map<String,String> getAllProvinces();
    //获取所有市级
     Map<String,String> getAllCitiesByProvince(String provinceId);
    //获取所有地区
     Map<String,String> getAllAreasByCity(String cityId);
     //根据市级长id获取短id
     Integer selectCiidByCityId(String CityId);
     //根据区级长id获取短id
     Integer selectAridByAreaId(String areaId);

}

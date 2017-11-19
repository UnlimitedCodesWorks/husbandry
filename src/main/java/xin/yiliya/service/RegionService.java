package xin.yiliya.service;

import java.util.Map;

public interface RegionService {

    //获取所有省级
    public Map<String,String> getAllProvinces();
    //获取所有市级
    public Map<String,String> getAllCitiesByProvince(String provinceId);
    //获取所有地区
    public Map<String,String> getAllAreasByCity(String cityId);

}

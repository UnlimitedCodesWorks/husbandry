package xin.yiliya.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.AreasMapper;
import xin.yiliya.dao.CitiesMapper;
import xin.yiliya.dao.ProvincesMapper;
import xin.yiliya.pojo.Areas;
import xin.yiliya.pojo.Cities;
import xin.yiliya.pojo.Provinces;

import javax.annotation.Resource;
import java.util.*;

@Service
public class RegionServiceImpl implements RegionService {

    @Resource
    private ProvincesMapper provincesMapper;

    @Resource
    private CitiesMapper citiesMapper;

    @Resource
    private AreasMapper areasMapper;

    @Resource
    private RedisTemplate<String,Provinces> redisProvincesTemplate;

    @Resource
    private RedisTemplate<String,Cities> redisCitiesTemplate;

    @Resource
    private RedisTemplate<String,Areas> redisAreasTemplate;


    public Map<String, String> getAllProvinces() {
        ListOperations<String, Provinces> list = redisProvincesTemplate.opsForList();
        List<Provinces> provincesList;
        Map<String,String> provinceMap = new LinkedHashMap<String, String>();
        if(list.size("provinces")==0){
            provincesList = provincesMapper.selectAllProvinces();
            list.rightPushAll("provinces",provincesList);
        }else{
            provincesList = list.range("provinces",0,-1);
        }
        for(Provinces province: provincesList){
            provinceMap.put(province.getProvince(), String.valueOf(province.getProvinceId()));
        }
        return provinceMap;
    }

    public Map<String, String> getAllCitiesByProvince(String provinceId) {
        ListOperations<String, Cities> list = redisCitiesTemplate.opsForList();
        List<Cities> citiesList;
        Map<String,String> citiesMap = new LinkedHashMap<String, String>();
        if(list.size("110000")==0){
            citiesList = citiesMapper.selectAllCities();
            for(Cities city:citiesList){
                list.rightPush(city.getProvinceId(),city);
            }
            citiesList = citiesMapper.selectAllCitiesByProvince(provinceId);
        }else{
            citiesList = list.range(provinceId,0,-1);

        }
        for(Cities citie : citiesList){
            citiesMap.put(citie.getCity(), String.valueOf(citie.getCityId()));
        }
        return citiesMap;
    }

    public Map<String, String> getAllAreasByCity(String cityId) {
        ListOperations<String, Areas> list = redisAreasTemplate.opsForList();
        List<Areas> areasList;
        Map<String,String> aresMap = new LinkedHashMap<String, String>();
        if(list.size("110100")==0){
            areasList = areasMapper.selectAllAreas();
            for(Areas area:areasList){
                list.rightPush(area.getCityId(),area);
            }
            areasList = areasMapper.selectAllAreasByCity(cityId);
        }else {
             areasList = list.range(cityId,0,-1);
        }
        for(Areas area:areasList){
            aresMap.put(area.getArea(), String.valueOf(area.getAreaId()));
        }
        return aresMap;
    }

    public Integer selectCiidByCityId(String CityId) {
        return citiesMapper.selectCiidByCityId(CityId);
    }

    public Integer selectAridByAreaId(String areaId) {
        return areasMapper.selectAridByAreaId(areaId);
    }
}

package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.Areas;

import java.util.List;

@Repository
public interface AreasMapper {

     List<Areas> selectAllAreasByCity(String cityId);

     List<Areas> selectAllAreas();

     Integer selectAridByAreaId(String areaId);
}
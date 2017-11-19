package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.Areas;

import java.util.List;

@Repository
public interface AreasMapper {

    public List<Areas> selectAllAreasByCity(String cityId);

    public List<Areas> selectAllAreas();
}
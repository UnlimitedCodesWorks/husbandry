package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.Provinces;

import java.util.List;

@Repository
public interface ProvincesMapper {

    public List<Provinces> selectAllProvinces();
}
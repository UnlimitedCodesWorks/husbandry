package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.Service;

import java.util.List;

@Repository
public interface ServiceMapper {

    public List<Service> getAllService();
}

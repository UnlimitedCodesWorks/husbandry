package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.Service;

import java.util.List;

@Repository
public interface ServiceMapper {

     List<Service> getAllService();

     Integer getSerId(String serKind);

     float getServiceKindPrice(Integer serid);

     String getSerKindBySerId(Integer serid);

}

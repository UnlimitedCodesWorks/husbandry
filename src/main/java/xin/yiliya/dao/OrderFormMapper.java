package xin.yiliya.dao;

import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.Problem;

import java.util.List;

@Repository
public interface OrderFormMapper {
    List<Problem> getAllOrderFormRow(Integer kind);
}

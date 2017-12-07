package xin.yiliya.service;

import org.springframework.stereotype.Service;
import xin.yiliya.dao.OrderFormMapper;
import xin.yiliya.pojo.Problem;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrderFormServiceImpl implements OrderFormService{

    @Resource
    private OrderFormMapper orderFormMapper;


    public List<Problem> getAllOrderFormRow(Integer kind) {
        return orderFormMapper.getAllOrderFormRow(kind);
    }
}

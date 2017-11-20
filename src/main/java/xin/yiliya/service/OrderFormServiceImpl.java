package xin.yiliya.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.OrderFormMapper;
import xin.yiliya.dao.ServiceMapper;
import xin.yiliya.pojo.Problem;

import java.util.List;

@Service
public class OrderFormServiceImpl implements OrderFormService{

    @Autowired
    OrderFormMapper orderFormMapper;

    @Autowired
    ServiceMapper serviceMapper;

    public List<Problem> getAllOrderFormRow(String kind) {
        return orderFormMapper.getAllOrderFormRow(serviceMapper.getSerId(kind));
    }
}

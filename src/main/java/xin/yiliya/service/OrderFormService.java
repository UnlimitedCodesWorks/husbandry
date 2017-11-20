package xin.yiliya.service;

import org.springframework.stereotype.Service;
import xin.yiliya.pojo.Problem;

import java.util.List;

@Service
public interface OrderFormService {

    //根据种类名获取全部问题及对应的答案
    public List<Problem> getAllOrderFormRow(String kind);
}

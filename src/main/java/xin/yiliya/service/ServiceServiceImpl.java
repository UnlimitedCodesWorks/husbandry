package xin.yiliya.service;

import xin.yiliya.dao.ServiceMapper;
import xin.yiliya.pojo.Service;

import javax.annotation.Resource;
import java.text.DecimalFormat;
import java.util.List;


@org.springframework.stereotype.Service
public class ServiceServiceImpl implements ServiceService {

    @Resource
    private ServiceMapper serviceMapper;

    public List<Service> getAllService() {
        return serviceMapper.getAllService();
    }

    public float getServiceKindPrice(Integer serid) {
        DecimalFormat decimalFormat = new DecimalFormat("0.0");
        return Float.parseFloat(decimalFormat.format(serviceMapper.getServiceKindPrice(serid)));
    }

    public String getSerKindBySerId(Integer serid) {
        return serviceMapper.getSerKindBySerId(serid);
    }
}

package xin.yiliya.service;

import org.springframework.stereotype.Service;
import xin.yiliya.pojo.RegisterStore;

public interface StoreService {

    //注册厂商接口
    //返回：一个注册是否成功的布尔值
    public Boolean register(RegisterStore store);
}

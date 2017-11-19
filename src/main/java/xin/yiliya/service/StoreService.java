package xin.yiliya.service;

import org.springframework.stereotype.Service;
import xin.yiliya.pojo.RegisterStore;
import xin.yiliya.pojo.Store;

public interface StoreService {

    //注册厂商
    //返回：一个注册是否成功的布尔值
    public Boolean register(RegisterStore store);

    // 厂商登录
    //返回：厂商的实体Bean
    public Store login(String loginName,String password);

}

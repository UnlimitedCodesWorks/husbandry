package xin.yiliya.service;

import org.springframework.stereotype.Service;
import xin.yiliya.pojo.RegisterStore;
import xin.yiliya.pojo.Store;
import xin.yiliya.pojo.StoreInfo;
import xin.yiliya.pojo.UpdateStore;

public interface StoreService {

    //注册厂商
    //返回：注册成功的厂商id，若注册未成功，则返回0
    Integer register(RegisterStore store);

    // 厂商登录
    //返回：厂商的实体Bean
    Store login(String loginName, String password);

    //厂商修改个人信息
    //返回：一个修改是否成功的布尔值
    Boolean update(UpdateStore updateStore);

    //根据id获取所有信息
    //返回：厂商信息bean
    StoreInfo getInfoByStoreId(Integer storeId);

}

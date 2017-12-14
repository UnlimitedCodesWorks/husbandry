package xin.yiliya.service;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import xin.yiliya.pojo.*;

import java.util.List;

public interface StoreService {

    //注册厂商
    //返回：注册成功的厂商id，若注册未成功，则返回0
    Integer register(RegisterStore store);

    // 厂商登录
    //返回：厂商的id和账号
    Store login(String loginName, String password);

    //获取厂商个人信息
    //返回：厂商的个人信息Bean
    Store getStoreInfo(Integer storeId);

    //厂商修改个人信息
    //返回：一个修改是否成功的布尔值
    Boolean update(UpdateStore updateStore);

    //根据id获取详细信息
    //返回：厂商详细信息bean
    StoreInfo getInfoByStoreId(Integer storeId);

    //获取全国热门服务商
    //参数：schema表示输入的排序模式，可输入参数为Rank.GRADE_DESC,Rank.SALES_DESC,Rank.HITS_DESC
    //返回多个初始页面服务商bean
    List<StoreIndex> getAllHotStore(int schema);


}

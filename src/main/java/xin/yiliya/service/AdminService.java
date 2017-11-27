package xin.yiliya.service;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import xin.yiliya.pojo.Admin;
import xin.yiliya.pojo.OfferServiceAdmin;
import xin.yiliya.pojo.StoreAdmin;

import java.util.Date;
import java.util.Map;

@Service
public interface AdminService {

    //管理员登录
    Admin AdminLogin(String adminNum,String adminPass);

    //获取用户总数
    Integer getUserNum();

    //获取商户总数
    Integer getStoreNum();

    //获取未验证通过商户总数
    Integer getUnpassStoreNum();

    //获取已验证通过商户总数
    Integer getPassStoreNum();

    //获取某年每月的订单成交量
    //返回一个Map对象，第一个参数为月份，第二个参数为订单成交量
    Map<Integer,Integer> getOrderNumPerYear(Date time);

    //获取家政系统实时市场价
    //返回一个Map对象，第一个参数为服务类型名，第二参数为市场价
    Map<String,Float> getRealTimeMarketPrice();

    //获取待认证的商户
    //返回：多个StoreAdmin对象，里面包含需要的各种信息
    PageInfo<StoreAdmin> getUnpassStores(int currentPage,int pageSize);

    //商户认证通过
    //返回：商户是否认证通过的布尔值
    Boolean passStore(Integer storeId);

    //查看厂商资质图片
    //返回：该厂商资质图片链接
    String[] getAptitudeByStoreId(Integer storeId);

    //输入商户名模糊搜索待认证的商户
    //返回：多个StoreAdmin对象，里面包含需要的各种信息
    PageInfo<StoreAdmin> getUnpassStores(String input,int currentPage,int pageSize);

    //获取认证的商户
    //返回：多个StoreAdmin对象，里面包含需要的各种信息
    PageInfo<StoreAdmin> getPassStores(int currentPage,int pageSize);

    //输入商户名模糊搜索认证的商户
    //返回：多个StoreAdmin对象，里面包含需要的各种信息
    PageInfo<StoreAdmin> getPassStores(String input,int currentPage,int pageSize);

    //撤销厂商资格
    //返回：撤销厂商是否成功的布尔值
    Boolean cancelStore(Integer storeId);

    //列出任意分数下的商户
    //返回：多个StoreAdmin对象，里面包含需要的各种信息
    PageInfo<StoreAdmin> getStoresByGrade(Float grade,int currentPage,int pageSize);

    //列出所有待认证的服务
    //返回:多个OfferSerivceAdmin对象，里面包含需要的各种信息
    PageInfo<OfferServiceAdmin> getUnpassServices(int currentPage,int pageSize);

    //输入商户名模糊搜索未认证的服务
    //返回:多个OfferSerivceAdmin对象，里面包含需要的各种信息
    PageInfo<OfferServiceAdmin> getUnpassServices(String input,int currentPage,int pageSize);
}

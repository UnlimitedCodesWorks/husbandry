package xin.yiliya.service;

import org.springframework.stereotype.Service;
import xin.yiliya.pojo.Admin;

@Service
public interface AdminService {

    //管理员登录
    public Admin AdminLogin(String adminNum,String adminPass);
}

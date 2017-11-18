package xin.yiliya.service;

import org.springframework.stereotype.Service;
import xin.yiliya.pojo.Admin;

@Service
public interface AdminService {
    public Admin AdminLogin(String adminNum,String adminPass);   //管理员登录
}

package xin.yiliya.service;

import org.springframework.stereotype.Service;
import xin.yiliya.dao.AdminMapper;
import xin.yiliya.pojo.Admin;

import javax.annotation.Resource;

@Service
public class AdminServiceImpl implements AdminService{

    @Resource
    AdminMapper adminMapper;

    public Admin AdminLogin(String adminNum,String adminPass){
        return adminMapper.AdminLogin(adminNum,adminPass);
    }
}

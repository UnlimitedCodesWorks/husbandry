package xin.yiliya.service;

import org.springframework.stereotype.Service;
import xin.yiliya.pojo.RegisterUser;
import xin.yiliya.pojo.User;

@Service
public interface UserService {
    //用户注册接口
    //返回：一个注册是否成功的布尔值
    public Boolean userRegister(RegisterUser registerUser);

    //用户登录接口
    //返回：User对象类型
    public User userLogin(String registNum,String password);
}

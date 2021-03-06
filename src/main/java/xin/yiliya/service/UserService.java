package xin.yiliya.service;

import org.springframework.stereotype.Service;
import xin.yiliya.pojo.RegisterUser;
import xin.yiliya.pojo.UpdateUser;
import xin.yiliya.pojo.User;

@Service
public interface UserService {
    //用户注册接口
    //返回：一个注册是否成功的布尔值
    Boolean userRegister(RegisterUser registerUser);

    //用户登录接口
    //返回：User对象类型
    User userLogin(String registNum,String password);

    //修改个人信息(我的信息、账号安全)
    Boolean userMyInfoUpdate(UpdateUser updateUser);

    //获取个人信息
    User getUserInfo(Integer userId);

}

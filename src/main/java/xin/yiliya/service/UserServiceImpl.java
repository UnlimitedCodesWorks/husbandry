package xin.yiliya.service;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.UserMapper;
import xin.yiliya.pojo.RegisterUser;
import xin.yiliya.pojo.User;
import xin.yiliya.tool.AliOssTool;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    AliOssTool aliOssTool;

    @Autowired
    UserMapper userMapper;

    public Boolean userRegister(RegisterUser registerUser){
        try{
            String password=registerUser.getPassword();
            registerUser.setPassword(DigestUtils.md5Hex(password));
            User user=new User();
            BeanUtils.copyProperties(user,registerUser);
            user.setHeadImg(aliOssTool.putImage(registerUser.getHeadImg(),"user"));
            userMapper.insertSelective(user);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public User userLogin(String registNum,String password){
        return userMapper.userLogin(registNum,password);
    }
}

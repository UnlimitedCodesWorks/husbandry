package xin.yiliya.service;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.CitiesMapper;
import xin.yiliya.dao.UserMapper;
import xin.yiliya.pojo.RegisterUser;
import xin.yiliya.pojo.UpdateUser;
import xin.yiliya.pojo.User;
import xin.yiliya.tool.AliOssTool;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    AliOssTool aliOssTool;

    @Autowired
    UserMapper userMapper;

    @Autowired
    CitiesMapper citiesMapper;

    public Boolean userRegister(RegisterUser registerUser){
        try{
            String password=registerUser.getPassword();
            registerUser.setPassword(DigestUtils.md5Hex(password));
            User user=new User();
            BeanUtils.copyProperties(user,registerUser);
            user.setHeadImg(aliOssTool.putImage(registerUser.getHeadImg(),"user"));
            user.setCityId(citiesMapper.selectCiidByCityId(registerUser.getCityId()));
            userMapper.insertSelective(user);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public User userLogin(String registNum,String password){
        return userMapper.userLogin(registNum,password);
    }

    public Boolean userMyInfoUpdate(UpdateUser updateUser){
        try{
            if(updateUser.getPassword()!=null){
                updateUser.setPassword(DigestUtils.md5Hex(updateUser.getPassword()));
            }
            User user=new User();
            BeanUtils.copyProperties(user,updateUser);
            if (updateUser.getCityId()!=null){
                user.setCityId(citiesMapper.selectCiidByCityId(updateUser.getCityId()));
            }
            if(updateUser.getHeadImg()!=null){
                if(updateUser.getHeadLink()!=null){
                    aliOssTool.deleteFileByLink(updateUser.getHeadLink());
                }
                user.setHeadImg(aliOssTool.putImage(updateUser.getHeadImg(),"user"));
            }
            userMapper.updateByPrimaryKeySelective(user);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}

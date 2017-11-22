package xin.yiliya.service;

import org.springframework.stereotype.Service;
import xin.yiliya.dao.EserviceUserMapper;
import xin.yiliya.pojo.EserviceUser;

import javax.annotation.Resource;
import java.util.Date;

@Service
public class EserviceUserServiceImpl implements EserviceUserService {

    @Resource
    EserviceUserMapper eserviceUserMapper;

    public Integer reply(EserviceUser eserviceUser) {
        try{
            eserviceUser.setTime(new Date());
            eserviceUserMapper.insertSelective(eserviceUser);
            return eserviceUser.getEserviceuserid();
        }catch (Exception e){
            return 0;
        }

    }

    public Boolean deleteReplyById(Integer replyId) {
        try {
            eserviceUserMapper.deleteByPrimaryKey(replyId);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}

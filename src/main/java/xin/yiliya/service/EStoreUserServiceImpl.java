package xin.yiliya.service;

import org.springframework.stereotype.Service;
import xin.yiliya.dao.EstoreUserMapper;
import xin.yiliya.pojo.EserviceUser;
import xin.yiliya.pojo.EstoreUser;

import javax.annotation.Resource;
import java.util.Date;

@Service
public class EStoreUserServiceImpl implements EStoreUserService {

    @Resource
    EstoreUserMapper estoreUserMapper;

    public Integer reply(EstoreUser estoreUser) {
        try {
            estoreUser.setTime(new Date());
            estoreUserMapper.insertSelective(estoreUser);
            return estoreUser.getEstoreuserid();
        }catch (Exception e){
            return 0;
        }
    }

    public Boolean deleteReplyById(Integer replyId) {
        try{
            estoreUserMapper.deleteByPrimaryKey(replyId);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}

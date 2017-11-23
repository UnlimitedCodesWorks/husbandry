package xin.yiliya.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.EstoreUserMapper;
import xin.yiliya.pojo.EserviceUser;
import xin.yiliya.pojo.EstoreUser;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class EStoreUserServiceImpl implements EStoreUserService {

    @Resource
    private EstoreUserMapper estoreUserMapper;

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

    public PageInfo<EstoreUser> getAllEstoreUserByEstoreId(Integer estoreId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        PageHelper.orderBy("time desc");
        List<EstoreUser> list = estoreUserMapper.getAllEstoreUserByEstoreId(estoreId);
        return new PageInfo<EstoreUser>(list);
    }
}

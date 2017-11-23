package xin.yiliya.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.EserviceUserMapper;
import xin.yiliya.pojo.EserviceUser;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class EserviceUserServiceImpl implements EserviceUserService {

    @Resource
    private EserviceUserMapper eserviceUserMapper;

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

    public PageInfo<EserviceUser> getAllReplyByEvaluateId(Integer evaluateId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        PageHelper.orderBy("time desc");
        List<EserviceUser> list = eserviceUserMapper.getAllReplyByEvaluateId(evaluateId);
        return new PageInfo<EserviceUser>(list);
    }
}

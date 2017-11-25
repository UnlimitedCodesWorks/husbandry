package xin.yiliya.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.ComplainMapper;
import xin.yiliya.pojo.Complain;
import xin.yiliya.pojo.ComplainSimple;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class ComplainServiceImpl implements ComplainService {

    @Resource
    private ComplainMapper complainMapper;

    public Integer complainStore(Complain complain) {
        try {
            complain.setTime(new Date());
            complain.setStatus(0);
            complain.setStoreRead(0);
            complainMapper.insertSelective(complain);
            return complain.getComplainid();
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    public PageInfo<ComplainSimple> getAllComplainByStoreId(Integer storeId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<ComplainSimple> list = complainMapper.getAllComplainByStoreId(storeId);
        for(ComplainSimple complainSimple : list){
            complainMapper.updateReadStautsById(complainSimple.getComplainid());
        }
        return new PageInfo<ComplainSimple>(list);
    }

    public Boolean deleteComplainById(Integer complainId) {
        try {
            complainMapper.deleteByPrimaryKey(complainId);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public Integer getUnreadNumByStoreId(Integer storeId) {
        return complainMapper.getUnreadNumByStoreId(storeId);
    }
}

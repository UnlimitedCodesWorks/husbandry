package xin.yiliya.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.ConcernServiceMapper;
import xin.yiliya.dao.ConcernStoreMapper;
import xin.yiliya.dao.OfferServiceMapper;
import xin.yiliya.dao.StoreMapper;
import xin.yiliya.pojo.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class UserConcernServiceImpl implements UserConcernService{

    @Resource
    private OfferServiceMapper offerServiceMapper;

    @Resource
    private StoreMapper storeMapper;

    @Resource
    private ConcernServiceMapper concernServiceMapper;

    @Resource
    private ConcernStoreMapper concernStoreMapper;


    public PageInfo<OfferServiceSimple> userConcernServices(Integer userId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<OfferServiceSimple> list=offerServiceMapper.getAllUserConcernServices(userId);
        PageInfo<OfferServiceSimple> info=new PageInfo<OfferServiceSimple>(list);
        return info;
    }

    public PageInfo<StoreInfo> userConcernStores(Integer userId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<StoreInfo> list=storeMapper.getAllUserConcernStores(userId);
        PageInfo<StoreInfo> info=new PageInfo<StoreInfo>(list);
        return info;
    }

    public Boolean concernServiceJudgement(ConcernServiceKey key) {
        try{
            if(concernServiceMapper.concernServiceJudgement(key)!=0){
                return true;
            }else{
                return false;
            }
        }catch (Exception e){
            return false;
        }
    }

    public Boolean concernStoreJudgement(ConcernStoreKey key) {
        try{
            if(concernStoreMapper.concernStoreJudgement(key)!=0){
                return true;
            }else {
                return false;
            }
        }catch (Exception e){
            return false;
        }
    }

    public Boolean concernService(ConcernService concernService) {
        try{
            concernService.setTime(new Date());
            concernServiceMapper.insertSelective(concernService);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public Boolean concernStore(ConcernStore concernStore) {
        try{
            concernStore.setTime(new Date());
            concernStoreMapper.insertSelective(concernStore);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public Boolean unconcernService(ConcernServiceKey key) {
        try{
            concernServiceMapper.deleteByPrimaryKey(key);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public Boolean unconcernStore(ConcernStoreKey key) {
        try{
            concernStoreMapper.deleteByPrimaryKey(key);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}

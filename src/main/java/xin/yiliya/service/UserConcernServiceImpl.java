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

    @Resource
    private EvaluateStoreService evaluateStoreService;

    @Resource
    private OrderService orderService;


    public PageInfo<OfferServiceSimple> userConcernServices(Integer userId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<OfferServiceSimple> list=offerServiceMapper.getAllUserConcernServices(userId);
        for(OfferServiceSimple offerServiceSimple:list){
            Integer offerServiceId=offerServiceSimple.getOfferServiceId();
            offerServiceSimple.setMarkNum(offerServiceMapper.getServiceOfMarkNum(offerServiceId));
            offerServiceSimple.setServiceFans(offerServiceMapper.getServiceOfFans(offerServiceId));
        }
        return new PageInfo<OfferServiceSimple>(list);
    }

    public PageInfo<StoreIndex> userConcernStores(Integer userId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<StoreIndex> list=storeMapper.getAllUserConcernStores(userId);
        for(StoreIndex storeIndex:list){
            Integer storeId = storeIndex.getStoreId();
            storeIndex.setFans(storeMapper.getFansByStoreId(storeId));
            storeIndex.setGrade(evaluateStoreService.getGradeByStoreId(storeId));
            storeIndex.setMarkNum(orderService.getStoreServiceFinish(storeId));
        }
        return new PageInfo<StoreIndex>(list);
    }

    public Boolean concernServiceJudgement(ConcernServiceKey key) {
        try{
            return concernServiceMapper.concernServiceJudgement(key) != 0;
        }catch (Exception e){
            return false;
        }
    }

    public Boolean concernStoreJudgement(ConcernStoreKey key) {
        try{
            return concernStoreMapper.concernStoreJudgement(key) != 0;
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

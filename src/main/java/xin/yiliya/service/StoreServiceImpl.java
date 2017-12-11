package xin.yiliya.service;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.AptitudeMapper;
import xin.yiliya.dao.AreasMapper;
import xin.yiliya.dao.StoreMapper;
import xin.yiliya.pojo.*;
import xin.yiliya.tool.AliOssTool;
import xin.yiliya.tool.Rank;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Service
public class StoreServiceImpl implements StoreService {

    @Resource
    private AliOssTool aliOssTool;

    @Resource
    private StoreMapper storeMapper;

    @Resource
    private AptitudeMapper aptitudeMapper;

    @Resource
    private AreasMapper areasMapper;

    @Resource
    private EvaluateStoreService evaluateStoreService;

    @Resource
    private OrderService orderService;

    @Resource
    private RedisTemplate<String,StoreIndex> redisTemplate;


    public Integer register(RegisterStore registerStore) {
        try{
            String password = registerStore.getPassword();
            registerStore.setPassword(DigestUtils.md5Hex(password).substring(0,10));
            Store store = new Store();
            BeanUtils.copyProperties(store,registerStore);
            store.setRegistTime(new Date());
            //设置为未审核状态
            store.setStatus(0);
            store.setDetailInfo("暂无详细信息");
            store.setArid(areasMapper.selectAridByAreaId(registerStore.getAreaId()));
            store.setHeadImg(aliOssTool.putImage(registerStore.getHeadImg(),"store"));
            store.setLogoImg(aliOssTool.putImage(registerStore.getLogoImg(),"store"));
            storeMapper.insertSelective(store);
            Integer storeId = storeMapper.selectIdByRegistNum(store.getRegistNum());
            List<String> links = aliOssTool.putImages(registerStore.getAptitudeImgs(),"admin");
            for(String link : links){
                Aptitude aptitude = new Aptitude();
                aptitude.setStoreId(storeId);
                aptitude.setAptitudeImg(link);
                aptitudeMapper.insertSelective(aptitude);
            }
            return storeId;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    public Store login(String loginName, String password) {
        String realPassword = DigestUtils.md5Hex(password).substring(0,10);
        return storeMapper.selectAllByLogin(loginName,realPassword);
    }

    public Store getStoreInfo(String loginName) {
        return storeMapper.selectStoreInfo(loginName);
    }

    public Boolean update(UpdateStore updateStore) {
        try{
            String password = updateStore.getPassword();
            if(password!=null){
                updateStore.setPassword(DigestUtils.md5Hex(password).substring(0,10));
            }
            Store store = new Store();
            BeanUtils.copyProperties(store,updateStore);
            if(updateStore.getAreaId()!=null){
                store.setArid(areasMapper.selectAridByAreaId(updateStore.getAreaId()));
            }
            if(updateStore.getHeadImg()!=null){
                if(updateStore.getHeadLink()!=null){
                    aliOssTool.deleteFileByLink(updateStore.getHeadLink());
                }
                store.setHeadImg(aliOssTool.putImage(updateStore.getHeadImg(),"store"));
            }
            if(updateStore.getLogoImg()!=null){
                if(updateStore.getLogoLink()!=null){
                    aliOssTool.deleteFileByLink(updateStore.getLogoLink());
                }
                store.setLogoImg(aliOssTool.putImage(updateStore.getLogoImg(),"store"));
            }
            storeMapper.updateByPrimaryKeySelective(store);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public StoreInfo getInfoByStoreId(Integer storeId) {
        StoreInfo storeInfo = storeMapper.selectByPrimaryKey(storeId);
        storeInfo.setGrade(evaluateStoreService.getGradeByStoreId(storeId));
        return storeInfo;
    }

    public List<StoreIndex> getAllHotStore(int schema) {
        PageHelper.startPage(1,12);
        List<StoreIndex> storeList = null;
        ListOperations<String,StoreIndex> list = redisTemplate.opsForList();
        switch (schema){
            case Rank.GRADE_DESC :
                if(list.size("hotStoreByGrade") == 0){
                    storeList = storeMapper.getAllHotStore();
                    if(storeList.size() != 0){
                        for(StoreIndex store:storeList){
                            store.setFans(storeMapper.getFansByStoreId(store.getStoreId()));
                            store.setGrade(evaluateStoreService.getGradeByStoreId(store.getStoreId()));
                            store.setMarkNum(orderService.getStoreServiceFinish(store.getStoreId()));
                        }
                        Collections.sort(storeList, new Comparator<StoreIndex>() {
                            public int compare(StoreIndex o1, StoreIndex o2) {
                                if(o1.getGrade()<o2.getGrade()) return 1;
                                else if(o1.getGrade()>o2.getGrade()) return -1;
                                return 0;
                            }
                        });
                        list.rightPushAll("hotStoreByGrade",new PageInfo<StoreIndex>(storeList).getList());
                        redisTemplate.expire("hotStoreByGrade",5, TimeUnit.MINUTES);
                    }

                }else{
                    storeList = list.range("hotStoreByGrade",0,-1);
                }
                break;
            case Rank.SALES_DESC :
                if(list.size("hotStoreBySales") == 0){
                    storeList = storeMapper.getAllHotStore();
                    if(storeList.size() != 0) {
                        for (StoreIndex store : storeList) {
                            store.setFans(storeMapper.getFansByStoreId(store.getStoreId()));
                            store.setGrade(evaluateStoreService.getGradeByStoreId(store.getStoreId()));
                            store.setMarkNum(orderService.getStoreServiceFinish(store.getStoreId()));
                        }
                        Collections.sort(storeList, new Comparator<StoreIndex>() {
                            public int compare(StoreIndex o1, StoreIndex o2) {
                                if (o1.getMarkNum() < o2.getMarkNum()) return 1;
                                else if (o1.getMarkNum() > o2.getMarkNum()) return -1;
                                return 0;
                            }
                        });
                        list.rightPushAll("hotStoreBySales", new PageInfo<StoreIndex>(storeList).getList());
                        redisTemplate.expire("hotStoreBySales", 5, TimeUnit.MINUTES);
                    }
                }else{
                    storeList = list.range("hotStoreBySales",0,-1);
                }
                break;
            case Rank.HITS_DESC :
                if(list.size("hotStoreByHITS") == 0){
                    storeList = storeMapper.getAllHotStore();
                    if(storeList.size() != 0) {
                        for (StoreIndex store : storeList) {
                            store.setFans(storeMapper.getFansByStoreId(store.getStoreId()));
                            store.setGrade(evaluateStoreService.getGradeByStoreId(store.getStoreId()));
                            store.setMarkNum(orderService.getStoreServiceFinish(store.getStoreId()));
                        }
                        Collections.sort(storeList, new Comparator<StoreIndex>() {
                            public int compare(StoreIndex o1, StoreIndex o2) {
                                if (o1.getFans() < o2.getFans()) return 1;
                                else if (o1.getFans() > o2.getFans()) return -1;
                                return 0;
                            }
                        });
                        list.rightPushAll("hotStoreByHITS", new PageInfo<StoreIndex>(storeList).getList());
                        redisTemplate.expire("hotStoreByHITS", 5, TimeUnit.MINUTES);
                    }
                }else{
                    storeList = list.range("hotStoreByHITS",0,-1);
                }
                break;
        }
        return storeList;
    }

}

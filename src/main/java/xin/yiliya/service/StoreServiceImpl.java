package xin.yiliya.service;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.AptitudeMapper;
import xin.yiliya.dao.AreasMapper;
import xin.yiliya.dao.StoreMapper;
import xin.yiliya.pojo.*;
import xin.yiliya.tool.AliOssTool;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

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

    public Integer register(RegisterStore registerStore) {
        try{
            String password = registerStore.getPassword();
            registerStore.setPassword(DigestUtils.md5Hex(password).substring(0,10));
            Store store = new Store();
            BeanUtils.copyProperties(store,registerStore);
            store.setRegistTime(new Date());
            store.setStatus(0);
            store.setArid(areasMapper.selectAridByAreaId(registerStore.getAreaId()));
            store.setHeadImg(aliOssTool.putImage(registerStore.getHeadImg(),"store"));
            store.setLogoImg(aliOssTool.putImage(registerStore.getLogoImg(),"store"));
            storeMapper.insertSelective(store);
            Integer storeId = storeMapper.selectIdByRegistNum(store.getRegistNum());
            List<String> links = aliOssTool.putImages(registerStore.getAptitudeImgs(),"store");
            for(String link : links){
                Aptitude aptitude = new Aptitude();
                aptitude.setStoreId(storeId);
                aptitude.setAptitudeImg(link);
                aptitudeMapper.insertSelective(aptitude);
            }
            return storeId;
        }catch (Exception e){
            return 0;
        }
    }

    public Store login(String loginName, String password) {
        String realPassword = DigestUtils.md5Hex(password).substring(0,10);
        return storeMapper.selectAllByLogin(loginName,realPassword);
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

}

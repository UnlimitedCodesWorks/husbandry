package xin.yiliya.service;

import com.aliyun.oss.OSSClient;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import xin.yiliya.dao.AptitudeMapper;
import xin.yiliya.dao.StoreMapper;
import xin.yiliya.pojo.Aptitude;
import xin.yiliya.pojo.RegisterStore;
import xin.yiliya.pojo.Store;
import xin.yiliya.tool.AliOssTool;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;

@Service
public class StoreServiceImpl implements StoreService {

    @Autowired
    AliOssTool aliOssTool;

    @Autowired
    StoreMapper storeMapper;

    @Autowired
    AptitudeMapper aptitudeMapper;

    public Boolean register(RegisterStore registerStore) {
        try{
            String password = registerStore.getPassword();
            registerStore.setPassword(DigestUtils.md5Hex(password).substring(0,10));
            Store store = new Store();
            BeanUtils.copyProperties(registerStore,store);
            store.setRegistTime(new Date());
            store.setStatus(0);
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
            return true;
        }catch (Exception e){
            return false;
        }


    }
}

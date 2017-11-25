package xin.yiliya.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.StoreNewsMapper;
import xin.yiliya.pojo.StoreNews;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class StoreNewsServiceImpl implements StoreNewsService {

    @Resource
    private StoreNewsMapper storeNewsMapper;

    public Integer addNew(StoreNews storeNews) {
        try {
            storeNews.setTime(new Date());
            storeNews.setReadStatus(0);
            storeNewsMapper.insertSelective(storeNews);
            return storeNews.getStorenewsid();
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    public Boolean deleteNewById(Integer storeNewId) {
        try {
            storeNewsMapper.deleteByPrimaryKey(storeNewId);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public PageInfo<StoreNews> getAllNewsByStoreId(Integer storeId, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<StoreNews> list = storeNewsMapper.getAllNewsByStoreId(storeId);
        for(StoreNews storeNews : list){
            storeNewsMapper.updateReadStautsById(storeNews.getStorenewsid());
        }
        return new PageInfo<StoreNews>(list);
    }

    public Integer getUnreadNumByStoreId(Integer storeId) {
        return storeNewsMapper.getUnreadNumByStoreId(storeId);
    }
}

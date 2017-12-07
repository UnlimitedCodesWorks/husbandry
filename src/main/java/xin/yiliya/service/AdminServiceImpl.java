package xin.yiliya.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.AdminMapper;
import xin.yiliya.dao.ServiceMapper;
import xin.yiliya.pojo.Admin;
import xin.yiliya.pojo.OfferServiceAdmin;
import xin.yiliya.pojo.StoreAdmin;

import javax.annotation.Resource;;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class AdminServiceImpl implements AdminService{

    @Resource
    private AdminMapper adminMapper;

    @Resource
    private ServiceService serviceService;

    @Resource
    private ServiceMapper serviceMapper;

    @Resource
    private EvaluateStoreService evaluateStoreService;

    public Admin AdminLogin(String adminNum,String adminPass){
        return adminMapper.AdminLogin(adminNum,adminPass);
    }

    public Integer getUserNum() {
        return adminMapper.getUserNum();
    }

    public Integer getStoreNum() {
        return adminMapper.getStoreNum();
    }

    public Integer getUnpassStoreNum() {
        return adminMapper.getUnpassStoreNum();
    }

    public Integer getPassStoreNum() {
        return adminMapper.getPassStoreNum();
    }

    public Map<Integer, Integer> getOrderNumPerYear(String time) {
        Map<Integer,Integer> orderMap = new LinkedHashMap<Integer, Integer>();
        for(int i =0;i<12;i++){
            String startTime = time + "-"+(i+1)+"-1";
            String endTime = time + "-" +(i+1)+"-31";
            orderMap.put(i+1,adminMapper.getOrderNumPerMonth(startTime,endTime));
        }
        return orderMap;
    }

    public Map<Integer,Integer> getOrderByNowYear(Date date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy");
        String nowTime = dateFormat.format(date);
        Map<Integer,Integer> orderMap = new LinkedHashMap<Integer, Integer>();
        for(int i =0;i<12;i++){
            String startTime = nowTime + "-"+(i+1)+"-1";
            String endTime = nowTime + "-" +(i+1)+"-31";
            orderMap.put(i+1,adminMapper.getOrderNumPerMonth(startTime,endTime));
        }
        return orderMap;
    }

    public Map<String, Float> getRealTimeMarketPrice() {
        Map<String,Float> marketPrice = new LinkedHashMap<String, Float>();
        for(int i=1;i<=8;i++){
            marketPrice.put(serviceMapper.getSerKindBySerId(i),serviceService.getServiceKindPrice(i));
        }
        return marketPrice;
    }

    public PageInfo<StoreAdmin> getUnpassStores(int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<StoreAdmin> list = adminMapper.getUnpassStores();
        return new PageInfo<StoreAdmin>(list);
    }

    public Boolean passStore(Integer storeId) {
        try {
            adminMapper.passStore(storeId);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public String[] getAptitudeByStoreId(Integer storeId) {
        return adminMapper.getAptitudeByStoreId(storeId);
    }

    public PageInfo<StoreAdmin> getUnpassStores(String input, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<StoreAdmin> list = adminMapper.getUnpassStoresBySearch(input);
        return new PageInfo<StoreAdmin>(list);
    }

    public PageInfo<StoreAdmin> getPassStores(int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<StoreAdmin> list = adminMapper.getPassStores();
        return new PageInfo<StoreAdmin>(list);
    }

    public PageInfo<StoreAdmin> getPassStores(String input, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<StoreAdmin> list = adminMapper.getPassStoresBySearch(input);
        return new PageInfo<StoreAdmin>(list);
    }

    public Boolean cancelStore(Integer storeId) {
        try {
            adminMapper.cancelStore(storeId);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public PageInfo<StoreAdmin> getStoresByGrade(Float grade,int currentPage,int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<StoreAdmin> list = adminMapper.getPassStores();
        Iterator<StoreAdmin> iterator = list.iterator();
        while(iterator.hasNext()){
            StoreAdmin storeAdmin = iterator.next();
            storeAdmin.setGrade(evaluateStoreService.getGradeByStoreId(storeAdmin.getStoreId()));
            if(storeAdmin.getGrade()>grade){
                iterator.remove();
            }
        }
        return new PageInfo<StoreAdmin>(list);
    }

    public PageInfo<OfferServiceAdmin> getUnpassServices(int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<OfferServiceAdmin> list = adminMapper.getUnpassServices();
        return new PageInfo<OfferServiceAdmin>(list);
    }

    public PageInfo<OfferServiceAdmin> getUnpassServices(String input, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<OfferServiceAdmin> list = adminMapper.getUnpassServicesBySearch(input);
        return new PageInfo<OfferServiceAdmin>(list);
    }
}

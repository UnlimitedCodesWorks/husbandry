package xin.yiliya.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.EstoreUserMapper;
import xin.yiliya.dao.EvaluateStoreMapper;
import xin.yiliya.pojo.*;
import xin.yiliya.tool.DateManager;
import xin.yiliya.tool.GradeJudge;

import javax.annotation.Resource;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

@Service
public class EvaluateStoreServiceImpl implements EvaluateStoreService {

    @Resource
    private EvaluateStoreMapper evaluateStoreMapper;

    @Resource
    private EStoreUserService eStoreUserService;

    @Resource
    private EstoreUserMapper estoreUserMapper;

    public Integer addEvaluate(EvaluateStore evaluateStore) {
        try{
            evaluateStore.setPraise(0);
            evaluateStore.setTime(new Date());
            evaluateStoreMapper.insertSelective(evaluateStore);
            return evaluateStore.getEvaluatestoreid();
        }catch (Exception e){
            return 0;
        }
    }

    public Boolean deleteEvaluateById(Integer evaluateId) {
        try {
            estoreUserMapper.deleteByEStoreId(evaluateId);
            evaluateStoreMapper.deleteByPrimaryKey(evaluateId);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public PageInfo<EvaluateStore> getAllEvaluateByStoreId(Integer storeId, Boolean pattern, int currentPage, int pageSize,int sonPageSize) {
        PageHelper.startPage(currentPage,pageSize);
        if(pattern){
            PageHelper.orderBy("time desc");
        }else{
            PageHelper.orderBy("praise desc");
        }
        List<EvaluateStore> list = evaluateStoreMapper.getAllEvaluateByStoreId(storeId);
        for(EvaluateStore evaluateStore:list){
            Integer evluateId = evaluateStore.getEvaluatestoreid();
            PageInfo<EstoreUser> estoreUserPageInfo = eStoreUserService.getAllEstoreUserByEstoreId(evluateId,1,sonPageSize);
            evaluateStore.setEstoreUserList(estoreUserPageInfo.getList());
            evaluateStore.setEstorePages(estoreUserPageInfo.getPages());
        }
        return new PageInfo<EvaluateStore>(list);
    }

    public Boolean support(Integer evaluateId) {
        try {
            evaluateStoreMapper.updatePraisePlusById(evaluateId);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public Boolean unsupport(Integer evaluateId) {
        try {
            evaluateStoreMapper.updatePraiseMinusById(evaluateId);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public Float getGradeByStoreId(Integer storeId) {
        DecimalFormat decimalFormat = new DecimalFormat("0.0");
        return Float.valueOf(decimalFormat.format(evaluateStoreMapper.getGradeByStoreId(storeId)));
    }

    public StoreEvalutePerMonth getGradePerMonthByStoreId(Integer storeId, String storeName, Date time) {
        DecimalFormat decimalFormat = new DecimalFormat("0.0");
        StoreEvalutePerMonth storeEvalutePerMonth = new StoreEvalutePerMonth();
        try{
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
            SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
            String nowTime = dateFormat.format(time);
            String nowTime1 = dateFormat1.format(time);
            String[] date = nowTime1.split("-");
            int year = Integer.valueOf(date[0]);
            int month = Integer.valueOf(date[1]);
            //int days = DateManager.getDaysByYearAndMonth(year,month);
            int days = Integer.valueOf(date[2]);
            storeEvalutePerMonth.setDate(time);
            storeEvalutePerMonth.setStoreName(storeName);
            List<StoreEvalutePerDay> storeEvalutePerDays = new LinkedList<StoreEvalutePerDay>();
            float gradeSum = 0;
            int gradeDay = 0;
            String startTime = nowTime + "-1"+" 00:00:00";
            for(int i=0;i<days;i++){
                StoreEvalutePerDay storeEvalutePerDay = new StoreEvalutePerDay();
                storeEvalutePerDay.setDayNum(i+1);
                String endTime = nowTime + "-" +(i+1)+" 23:59:59";
                storeEvalutePerDay.setGrade(Float.parseFloat(decimalFormat.format(evaluateStoreMapper.getGradePerDayByStoreId(storeId,startTime,endTime))));
                storeEvalutePerDay.setStatus(GradeJudge.judge(storeEvalutePerDay.getGrade()));
                storeEvalutePerDays.add(storeEvalutePerDay);
                gradeSum += storeEvalutePerDay.getGrade();
                if(storeEvalutePerDay.getGrade()!=0){
                    gradeDay++;
                }
            }
            if(gradeSum==0){
                gradeDay++;
            }
            storeEvalutePerMonth.setDays(storeEvalutePerDays);
            storeEvalutePerMonth.setGrade(Float.parseFloat(decimalFormat.format(gradeSum/gradeDay)));
            storeEvalutePerMonth.setStatus(GradeJudge.judge(storeEvalutePerMonth.getGrade()));
        }catch (Exception e){
            e.printStackTrace();
        }
        return storeEvalutePerMonth;
    }
}

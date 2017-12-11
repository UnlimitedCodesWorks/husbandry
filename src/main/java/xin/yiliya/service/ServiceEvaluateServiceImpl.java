package xin.yiliya.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.EserviceUserMapper;
import xin.yiliya.dao.EvaluateServiceMapper;
import xin.yiliya.dao.OrderMapper;
import xin.yiliya.pojo.EvaluateService;
import xin.yiliya.pojo.ServiceEvalutePerDay;
import xin.yiliya.pojo.ServiceEvalutePerMonth;
import xin.yiliya.tool.DateManager;
import xin.yiliya.tool.GradeJudge;

import javax.annotation.Resource;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

@Service
public class ServiceEvaluateServiceImpl implements ServiceEvaluateService {

    @Resource
    private EvaluateServiceMapper evaluateServiceMapper;

    @Resource
    private EserviceUserMapper eserviceUserMapper;

    @Resource
    private EserviceUserService eserviceUserService;

    @Resource
    private OrderMapper orderMapper;

    public Integer addEvaluate(EvaluateService evaluateService) {
        try {
            evaluateService.setTime(new Date());
            evaluateService.setPraise(0);
            orderMapper.updateOrderDone(evaluateService.getServiceId(),evaluateService.getUserId());
            evaluateServiceMapper.insertSelective(evaluateService);
            return evaluateService.getEvaluateserviceid();
        }catch (Exception e){
            return 0;
        }
    }

    public Boolean deleteEvaluateById(Integer evaluateId) {
        try{
            eserviceUserMapper.deleteByEserviceId(evaluateId);
            evaluateServiceMapper.deleteByPrimaryKey(evaluateId);
            return true;
        }catch (Exception e){
            return false;
        }

    }

    public PageInfo<EvaluateService> getAllEvaluateByServiceId(
            Integer serviceId,Boolean pattern, int currentPage, int pageSize,int sonPageSize) {
        PageHelper.startPage(currentPage,pageSize);
        if(pattern){
            PageHelper.orderBy("time desc");
        }else{
            PageHelper.orderBy("praise desc");
        }
        List<EvaluateService> list = evaluateServiceMapper.getAllEvaluateByServiceId(serviceId);
        for(EvaluateService reply:list){
            reply.setEserviceUsers(eserviceUserService.getAllReplyByEvaluateId(reply.getEvaluateserviceid(),1,sonPageSize).getList());
        }
        return new PageInfo<EvaluateService>(list);
    }

    public Boolean support(Integer evaluateId) {
        try{
            evaluateServiceMapper.updatePraisePlusById(evaluateId);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public Boolean unsupport(Integer evaluateId) {
        try{
            evaluateServiceMapper.updatePraiseMinusById(evaluateId);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public Float getGradeByServiceId(Integer serviceId) {
        DecimalFormat decimalFormat = new DecimalFormat("0.0");
        return Float.valueOf(decimalFormat.format(evaluateServiceMapper.getGradeByServiceId(serviceId)));
    }

    public Integer getGradeNumByServiceId(Integer serviceId) {
        return evaluateServiceMapper.getGradeNumByServiceId(serviceId);
    }

    public ServiceEvalutePerMonth getGradePerMonthBySeviceId(Integer serviceId,String serviceName,Date time)  {
        DecimalFormat decimalFormat = new DecimalFormat("0.0");
        ServiceEvalutePerMonth serviceEvalutePerMonth = new ServiceEvalutePerMonth();
        try{
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
            String nowTime = dateFormat.format(time);
            String[] date = nowTime.split("-");
            int year = Integer.valueOf(date[0]);
            int month = Integer.valueOf(date[1]);
            int days = DateManager.getDaysByYearAndMonth(year,month);
            serviceEvalutePerMonth.setDate(time);
            serviceEvalutePerMonth.setServiceName(serviceName);
            List<ServiceEvalutePerDay> serviceEvalutePerDays = new LinkedList<ServiceEvalutePerDay>();
            float gradeSum = 0;
            int gradeDay = 0;
            String startTime = nowTime + "-1"+" 00:00:00";
            for(int i=0;i<days;i++){
                ServiceEvalutePerDay serviceEvalutePerDay = new ServiceEvalutePerDay();
                serviceEvalutePerDay.setDayNum(i+1);
                String endTime = nowTime + "-" +(i+1)+" 23:59:59";
                serviceEvalutePerDay.setGrade(Float.parseFloat(decimalFormat.format(evaluateServiceMapper.getGradePerDayBySeviceId(serviceId,startTime,endTime))));
                serviceEvalutePerDay.setStatus(GradeJudge.judge(serviceEvalutePerDay.getGrade()));
                serviceEvalutePerDays.add(serviceEvalutePerDay);
                gradeSum += serviceEvalutePerDay.getGrade();
                if(serviceEvalutePerDay.getGrade()!=0){
                    gradeDay++;
                }
            }
            serviceEvalutePerMonth.setDays(serviceEvalutePerDays);
            serviceEvalutePerMonth.setGrade(Float.parseFloat(decimalFormat.format(gradeSum/gradeDay)));
            serviceEvalutePerMonth.setStatus(GradeJudge.judge(serviceEvalutePerMonth.getGrade()));
        }catch (Exception e){
            e.printStackTrace();
        }
        return serviceEvalutePerMonth;
    }

    public Boolean ReviewQualification(Integer serviceId, Integer userId) {
        int count = evaluateServiceMapper.ReviewQualification(serviceId,userId);
        return count > 0;
    }
}

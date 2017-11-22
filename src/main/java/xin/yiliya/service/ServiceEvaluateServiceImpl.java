package xin.yiliya.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import xin.yiliya.dao.EserviceUserMapper;
import xin.yiliya.dao.EvaluateServiceMapper;
import xin.yiliya.pojo.EvaluateService;

import javax.annotation.Resource;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

@Service
public class ServiceEvaluateServiceImpl implements ServiceEvaluateService {

    @Resource
    EvaluateServiceMapper evaluateServiceMapper;

    @Resource
    EserviceUserMapper eserviceUserMapper;

    public Integer addEvaluate(EvaluateService evaluateService) {
        try {
            evaluateService.setTime(new Date());
            evaluateService.setPraise(0);
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
            Integer serviceId,Boolean pattern, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        if(pattern){
            PageHelper.orderBy("time desc");
        }else{
            PageHelper.orderBy("praise desc");
        }
        List<EvaluateService> list = evaluateServiceMapper.getAllEvaluateByServiceId(serviceId);
        for(EvaluateService reply:list){
            reply.setEserviceUsers(eserviceUserMapper.getAllReplyByEvaluateId(reply.getEvaluateserviceid()));
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
}

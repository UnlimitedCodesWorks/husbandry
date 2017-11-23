package xin.yiliya.service;

import com.github.pagehelper.PageInfo;
import xin.yiliya.pojo.EvaluateService;
import xin.yiliya.pojo.ServiceEvalutePerMonth;

import java.util.Date;

public interface ServiceEvaluateService {

    //添加一个评论
    //返回：评论id,若返回0则添加评论失败
    Integer addEvaluate(EvaluateService evaluateService);

    //通过评论id删除一个评论
    //返回：删除是否成功的布尔值
    Boolean deleteEvaluateById(Integer evaluateId);

    //列出服务下的所有评论(包括子回复）
    //参数：pattern为true时代表默认模式按时间排序，为false时代表按热度排序
    // sonPageSize代表子回复所显示的个数
    //返回: 多个评论集合
    PageInfo<EvaluateService> getAllEvaluateByServiceId(
            Integer serviceId,Boolean pattern,int currentPage,int pageSize,int sonPageSize);

    //为评论点赞
    //返回：更新是否成功的布尔值
    Boolean support(Integer evaluateId);

    //为评论取消赞
    //返回：更新是否成功的布尔值
    Boolean unsupport(Integer evaluateId);

    //获取服务评分
    //返回:该服务的评分
    Float getGradeByServiceId(Integer serviceId);

    //获得某月份的服务评分曲线信息
    //参数：time为当前月份，如格式为2017-7
    //返回：该月每天的评分记录
    ServiceEvalutePerMonth getGradePerMonthBySeviceId(Integer serviceId,String serviceName,Date time);

}

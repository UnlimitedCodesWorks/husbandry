package xin.yiliya.service;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import xin.yiliya.pojo.EvaluateStore;
import xin.yiliya.pojo.ServiceEvalutePerMonth;
import xin.yiliya.pojo.StoreEvalutePerMonth;

import java.util.Date;

public interface EvaluateStoreService {

    //添加一个评论
    //返回：评论id,若返回0则添加评论失败
    Integer addEvaluate(EvaluateStore evaluateStore);

    //通过评论id删除一个评论
    //返回：删除是否成功的布尔值
    Boolean deleteEvaluateById(Integer evaluateId);

    //列出厂商下的所有评论(包括子回复）
    //参数：pattern为true时代表默认模式按时间排序，为false时代表按热度排序
    //返回: 多个评论集合
    PageInfo<EvaluateStore> getAllEvaluateByStoreId(
            Integer storeId,Boolean pattern,int currentPage,int pageSize);

    //为评论点赞
    //返回：更新是否成功的布尔值
    Boolean support(Integer evaluateId);

    //为评论取消赞
    //返回：更新是否成功的布尔值
    Boolean unsupport(Integer evaluateId);

    //获取厂商评分
    //返回:该厂商的评分
    Float getGradeByStoreId(Integer storeId);

    //获得某月份的厂商评分曲线信息
    //参数：time为当前月份，如格式为2017-7
    //返回：该月每天的评分记录
    StoreEvalutePerMonth getGradePerMonthByStoreId(Integer storeId, String storeName, Date time);

}

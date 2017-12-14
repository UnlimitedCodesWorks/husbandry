package xin.yiliya.pojo;

import java.util.Date;
import java.util.List;

public class EvaluateService {
    private Integer evaluateserviceid;

    private UserEvaluate user;

    private List<EserviceUser> eserviceUsers;

    private Integer serviceId;

    private String content;

    private Date time;

    private Integer praise;

    private float grade;

    private Integer userId;

    private Integer eservicePages;

    private String orderNum;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }


    public float getGrade() {
        return grade;
    }

    public void setGrade(float grade) {
        this.grade = grade;
    }

    public List<EserviceUser> getEserviceUsers() {
        return eserviceUsers;
    }

    public void setEserviceUsers(List<EserviceUser> eserviceUsers) {
        this.eserviceUsers = eserviceUsers;
    }

    public Integer getEvaluateserviceid() {
        return evaluateserviceid;
    }

    public void setEvaluateserviceid(Integer evaluateserviceid) {
        this.evaluateserviceid = evaluateserviceid;
    }

    public UserEvaluate getUser() {
        return user;
    }

    public void setUser(UserEvaluate user) {
        this.user = user;
    }

    public Integer getServiceId() {
        return serviceId;
    }

    public void setServiceId(Integer serviceId) {
        this.serviceId = serviceId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getPraise() {
        return praise;
    }

    public void setPraise(Integer praise) {
        this.praise = praise;
    }

    public Integer getEservicePages() {
        return eservicePages;
    }

    public void setEservicePages(Integer eservicePages) {
        this.eservicePages = eservicePages;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }
}
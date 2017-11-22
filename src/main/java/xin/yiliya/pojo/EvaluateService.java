package xin.yiliya.pojo;

import java.util.Date;
import java.util.List;

public class EvaluateService {
    private Integer evaluateserviceid;

    private Integer userId;

    private Integer serviceId;

    private String content;

    private Date time;

    private Integer praise;

    private float grade;

    public float getGrade() {
        return grade;
    }

    public void setGrade(float grade) {
        this.grade = grade;
    }

    private List<EserviceUser> eserviceUsers;

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

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
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
}
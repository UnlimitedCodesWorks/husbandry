package xin.yiliya.pojo;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class ServiceEvalutePerMonth {

    private String serviceName;

    private String status;

    private float grade;

    private Date date;

    private List<ServiceEvalutePerDay> days;

    public List<ServiceEvalutePerDay> getDays() {
        return days;
    }

    public void setDays(List<ServiceEvalutePerDay> days) {
        this.days = days;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public float getGrade() {
        return grade;
    }

    public void setGrade(float grade) {
        this.grade = grade;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}

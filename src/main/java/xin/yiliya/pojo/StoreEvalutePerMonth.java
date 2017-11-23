package xin.yiliya.pojo;

import java.util.Date;
import java.util.List;

public class StoreEvalutePerMonth {
    private String storeName;

    private String status;

    private float grade;

    private Date date;

    private List<StoreEvalutePerDay> days;

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
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

    public List<StoreEvalutePerDay> getDays() {
        return days;
    }

    public void setDays(List<StoreEvalutePerDay> days) {
        this.days = days;
    }
}

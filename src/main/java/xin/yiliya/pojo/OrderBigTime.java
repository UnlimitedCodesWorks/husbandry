package xin.yiliya.pojo;

import java.util.List;

public class OrderBigTime {
    private Integer orderpriceid;

    private Integer month;

    private Integer day;

    private Integer orderId;

    private List<OrderSmallTime> smallTimeList;

    public Integer getOrderpriceid() {
        return orderpriceid;
    }

    public void setOrderpriceid(Integer orderpriceid) {
        this.orderpriceid = orderpriceid;
    }

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public Integer getDay() {
        return day;
    }

    public void setDay(Integer day) {
        this.day = day;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public List<OrderSmallTime> getSmallTimeList() {
        return smallTimeList;
    }

    public void setSmallTimeList(List<OrderSmallTime> smallTimeList) {
        this.smallTimeList = smallTimeList;
    }
}
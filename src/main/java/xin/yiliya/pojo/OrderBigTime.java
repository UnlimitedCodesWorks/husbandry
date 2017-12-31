package xin.yiliya.pojo;

import java.util.List;

public class OrderBigTime {
    private Integer orderpriceid;

    private Integer month;

    private Integer day;

    private Integer orderId;

    private String sum;

    private List<OrderSmallTime> orderSmallTimeList;

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

    public String getSum() {
        return sum;
    }

    public void setSum(String sum) {
        this.sum = sum == null ? null : sum.trim();
    }

    public List<OrderSmallTime> getOrderSmallTimeList() {
        return orderSmallTimeList;
    }

    public void setOrderSmallTimeList(List<OrderSmallTime> orderSmallTimeList) {
        this.orderSmallTimeList = orderSmallTimeList;
    }
}
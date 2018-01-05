package xin.yiliya.pojo;

import java.util.Date;
import java.util.List;

public class UserRequire {

    private Integer orderId;

    private Date startTime;

    private List<Require> requireList;

    private OrderBigTime orderBigTime;

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public List<Require> getRequireList() {
        return requireList;
    }

    public void setRequireList(List<Require> requireList) {
        this.requireList = requireList;
    }

    public OrderBigTime getOrderBigTime() {
        return orderBigTime;
    }

    public void setOrderBigTime(OrderBigTime orderBigTime) {
        this.orderBigTime = orderBigTime;
    }
}

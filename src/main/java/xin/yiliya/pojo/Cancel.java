package xin.yiliya.pojo;

import java.util.Date;

public class Cancel {

    private Integer cancelid;

    private Integer userId;

    private String reason;

    private Integer status;

    private Integer orderId;

    private Date cancelTime;

    public Integer getCancelid() {
        return cancelid;
    }

    public void setCancelid(Integer cancelid) {
        this.cancelid = cancelid;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Date getCancelTime() {
        return cancelTime;
    }

    public void setCancelTime(Date cancelTime) {
        this.cancelTime = cancelTime;
    }
}

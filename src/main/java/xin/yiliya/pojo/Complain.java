package xin.yiliya.pojo;

import java.util.Date;

public class Complain {
    private Integer complainid;

    private Integer serviceId;

    private Integer userId;

    private Date time;

    private Integer status;

    private Integer storeRead;

    private String reason;

    public Integer getComplainid() {
        return complainid;
    }

    public void setComplainid(Integer complainid) {
        this.complainid = complainid;
    }

    public Integer getServiceId() {
        return serviceId;
    }

    public void setServiceId(Integer serviceId) {
        this.serviceId = serviceId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getStoreRead() {
        return storeRead;
    }

    public void setStoreRead(Integer storeRead) {
        this.storeRead = storeRead;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
    }
}
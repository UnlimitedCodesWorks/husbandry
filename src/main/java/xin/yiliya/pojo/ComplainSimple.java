package xin.yiliya.pojo;

import java.util.Date;

public class ComplainSimple {

    private Integer complainid;

    private Date time;

    private Integer status;

    private String reason;

    private OfferService service;

    private User user;

    public Integer getComplainid() {
        return complainid;
    }

    public void setComplainid(Integer complainid) {
        this.complainid = complainid;
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

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public OfferService getService() {
        return service;
    }

    public void setService(OfferService service) {
        this.service = service;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}

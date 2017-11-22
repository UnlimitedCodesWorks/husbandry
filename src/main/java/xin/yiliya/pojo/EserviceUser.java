package xin.yiliya.pojo;

import java.util.Date;

public class EserviceUser {
    private Integer eserviceuserid;

    private Integer eserviceId;

    private Integer userId;

    private Date time;

    private String content;

    public Integer getEserviceuserid() {
        return eserviceuserid;
    }

    public void setEserviceuserid(Integer eserviceuserid) {
        this.eserviceuserid = eserviceuserid;
    }

    public Integer getEserviceId() {
        return eserviceId;
    }

    public void setEserviceId(Integer eserviceId) {
        this.eserviceId = eserviceId;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}
package xin.yiliya.pojo;

import java.util.Date;

public class EstoreUser {
    private Integer estoreuserid;

    private Integer estoreId;

    private UserEvaluate user;

    private Date time;

    private String content;

    private Integer userId;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }


    public Integer getEstoreuserid() {
        return estoreuserid;
    }

    public void setEstoreuserid(Integer estoreuserid) {
        this.estoreuserid = estoreuserid;
    }

    public Integer getEstoreId() {
        return estoreId;
    }

    public void setEstoreId(Integer estoreId) {
        this.estoreId = estoreId;
    }

    public UserEvaluate getUser() {
        return user;
    }

    public void setUser(UserEvaluate user) {
        this.user = user;
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
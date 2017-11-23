package xin.yiliya.pojo;

import java.util.Date;
import java.util.List;

public class EvaluateStore {
    private Integer evaluatestoreid;

    private UserEvaluate user;

    private Integer storeId;

    private String content;

    private Date time;

    private Integer praise;

    private Integer userId;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    private List<EstoreUser> estoreUserList;

    public List<EstoreUser> getEstoreUserList() {
        return estoreUserList;
    }

    public void setEstoreUserList(List<EstoreUser> estoreUserList) {
        this.estoreUserList = estoreUserList;
    }

    public Integer getEvaluatestoreid() {
        return evaluatestoreid;
    }

    public void setEvaluatestoreid(Integer evaluatestoreid) {
        this.evaluatestoreid = evaluatestoreid;
    }

    public UserEvaluate getUser() {
        return user;
    }

    public void setUser(UserEvaluate user) {
        this.user = user;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getPraise() {
        return praise;
    }

    public void setPraise(Integer praise) {
        this.praise = praise;
    }
}
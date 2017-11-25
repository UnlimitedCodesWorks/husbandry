package xin.yiliya.pojo;

import java.util.Date;

public class StoreNews {
    private Integer storenewsid;

    private Integer storeId;

    private String type;

    private Date time;

    private Integer readStatus;

    private String content;

    public Integer getStorenewsid() {
        return storenewsid;
    }

    public void setStorenewsid(Integer storenewsid) {
        this.storenewsid = storenewsid;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getReadStatus() {
        return readStatus;
    }

    public void setReadStatus(Integer readStatus) {
        this.readStatus = readStatus;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}
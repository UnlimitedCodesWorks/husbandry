package xin.yiliya.pojo;

import java.util.Date;

public class OfferServiceSimple {
    private Integer offerServiceId;

    private String serviceName;

    private String serviceImg;

    private String introduce;

    private Date publishTime;

    private Date updateTime;

    private xin.yiliya.pojo.Service kind;

    public xin.yiliya.pojo.Service getKind() {
        return kind;
    }

    public void setKind(xin.yiliya.pojo.Service kind) {
        this.kind = kind;
    }

    public Integer getOfferServiceId() {
        return offerServiceId;
    }

    public void setOfferServiceId(Integer offerServiceId) {
        this.offerServiceId = offerServiceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getServiceImg() {
        return serviceImg;
    }

    public void setServiceImg(String serviceImg) {
        this.serviceImg = serviceImg;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}

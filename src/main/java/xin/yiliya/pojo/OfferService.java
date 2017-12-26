package xin.yiliya.pojo;

import java.util.Date;

public class OfferService {
    private Integer offerserviceid;

    private Integer storeId;

    private String serviceName;

    private String serviceImg;

    private Integer kind;

    private String price;

    private Date publishTime;

    private Date updateTime;

    private String peoplePhone;

    private String introduce;

    private String notice;

    private Integer view_num;

    private Integer status;


    public Integer getOfferserviceid() {
        return offerserviceid;
    }

    public void setOfferserviceid(Integer offerserviceid) {
        this.offerserviceid = offerserviceid;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName == null ? null : serviceName.trim();
    }

    public String getServiceImg() {
        return serviceImg;
    }

    public void setServiceImg(String serviceImg) {
        this.serviceImg = serviceImg == null ? null : serviceImg.trim();
    }

    public Integer getKind() {
        return kind;
    }

    public void setKind(Integer kind) {
        this.kind = kind;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price == null ? null : price.trim();
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

    public String getPeoplePhone() {
        return peoplePhone;
    }

    public void setPeoplePhone(String peoplePhone) {
        this.peoplePhone = peoplePhone == null ? null : peoplePhone.trim();
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice == null ? null : notice.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getView_num() {
        return view_num;
    }

    public void setView_num(Integer view_num) {
        this.view_num = view_num;
    }
}
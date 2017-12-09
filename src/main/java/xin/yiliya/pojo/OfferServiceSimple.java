package xin.yiliya.pojo;

import java.util.Date;

public class OfferServiceSimple {
    private Integer offerServiceId;

    private String serviceName;

    private String serviceImg;

    private String introduce;

    private Date publishTime;

    private Date updateTime;

    private float grade;

    private Integer gradeNum;

    private String status;

    private String price;

    private float marketPrice;

    private Boolean priceJudge;

    private Store store;

    private Integer markNum;

    private xin.yiliya.pojo.Service kind;

    public Integer getGradeNum() {
        return gradeNum;
    }

    public void setGradeNum(Integer gradeNum) {
        this.gradeNum = gradeNum;
    }

    public Integer getMarkNum() {
        return markNum;
    }

    public void setMarkNum(Integer markNum) {
        this.markNum = markNum;
    }

    public Boolean getPriceJudge() {
        return priceJudge;
    }

    public void setPriceJudge(Boolean priceJudge) {
        this.priceJudge = priceJudge;
    }

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public float getGrade() {
        return grade;
    }

    public void setGrade(float grade) {
        this.grade = grade;
    }

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

    public float getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(float marketPrice) {
        this.marketPrice = marketPrice;
    }
}

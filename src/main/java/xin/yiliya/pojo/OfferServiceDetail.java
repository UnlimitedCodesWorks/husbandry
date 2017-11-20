package xin.yiliya.pojo;

import java.util.Date;
import java.util.List;

public class OfferServiceDetail {
    private Integer offerserviceid;

    private StoreSimple store;

    private Integer storeId;

    private String serviceName;

    private String serviceImg;

    private String kind;

    private String price;

    private Date publishTime;

    private String peoplePhone;

    private String introduce;

    private String notice;

    private List<ServiceSpecial> serviceSpecial;

    private List<Cities> cities;

    private Integer markNum;

    private Integer orderNum;

    private Boolean priceJudgement;

    public Boolean getPriceJudgement() {
        return priceJudgement;
    }

    public void setPriceJudgement(Boolean priceJudgement) {
        this.priceJudgement = priceJudgement;
    }

    public List<Cities> getCities() {
        return cities;
    }

    public void setCities(List<Cities> cities) {
        this.cities = cities;
    }

    public List<ServiceSpecial> getServiceSpecial() {
        return serviceSpecial;
    }

    public void setServiceSpecial(List<ServiceSpecial> serviceSpecial) {
        this.serviceSpecial = serviceSpecial;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public Integer getOfferserviceid() {
        return offerserviceid;
    }

    public void setOfferserviceid(Integer offerserviceid) {
        this.offerserviceid = offerserviceid;
    }

    public StoreSimple getStore() {
        return store;
    }

    public void setStore(StoreSimple store) {
        this.store = store;
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

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public String getPeoplePhone() {
        return peoplePhone;
    }

    public void setPeoplePhone(String peoplePhone) {
        this.peoplePhone = peoplePhone;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }

    public Integer getMarkNum() {
        return markNum;
    }

    public void setMarkNum(Integer markNum) {
        this.markNum = markNum;
    }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }
}

package xin.yiliya.pojo;

import java.util.Date;

public class OrderShow {

    private Integer orderid;

    private String orderNumber;

    private Integer serviceId;

    private Integer userId;

    private Integer status;

    private Date startTime;

    private OfferService offerService;

    private StoreInfo storeInfo;

    private OrderBigTime orderBigTime;

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public OfferService getOfferService() {
        return offerService;
    }

    public void setOfferService(OfferService offerService) {
        this.offerService = offerService;
    }

    public StoreInfo getStoreInfo() {
        return storeInfo;
    }

    public void setStoreInfo(StoreInfo storeInfo) {
        this.storeInfo = storeInfo;
    }

    public OrderBigTime getOrderBigTime() {
        return orderBigTime;
    }

    public void setOrderBigTime(OrderBigTime orderBigTime) {
        this.orderBigTime = orderBigTime;
    }
}

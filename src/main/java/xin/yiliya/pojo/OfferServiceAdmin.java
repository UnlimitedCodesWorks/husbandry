package xin.yiliya.pojo;

public class OfferServiceAdmin {

    private Integer offerServiceId;

    private Store store;

    private String serviceName;

    private Service service;

    public Integer getOfferServiceId() {
        return offerServiceId;
    }

    public void setOfferServiceId(Integer offerServiceId) {
        this.offerServiceId = offerServiceId;
    }

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }
}

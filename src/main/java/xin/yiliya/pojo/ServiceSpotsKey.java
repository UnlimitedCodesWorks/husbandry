package xin.yiliya.pojo;

public class ServiceSpotsKey {
    private Integer offerserviceId;

    private Integer cityId;

    private Cities city;

    public Cities getCity() {
        return city;
    }

    public void setCity(Cities city) {
        this.city = city;
    }

    public Integer getOfferserviceId() {
        return offerserviceId;
    }

    public void setOfferserviceId(Integer offerserviceId) {
        this.offerserviceId = offerserviceId;
    }

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }
}
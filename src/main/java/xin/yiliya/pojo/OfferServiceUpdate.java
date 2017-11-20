package xin.yiliya.pojo;

import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;

public class OfferServiceUpdate {
    private Integer storeId;

    private Integer offerServiceId;

    private String serviceName;

    private MultipartFile serviceImg;

    private String serviceImgLink;

    private MultipartFile[] serviceSpecial;

    private List<String> serviceSpecialLink;

    private Integer[] cityIds;

    private Integer[] deleteCityIds;

    private Integer kind;

    private String price;

    private Date publishTime;

    private String peoplePhone;

    private String introduce;

    private String notice;


    public Integer[] getDeleteCityIds() {
        return deleteCityIds;
    }

    public void setDeleteCityIds(Integer[] deleteCityIds) {
        this.deleteCityIds = deleteCityIds;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
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

    public MultipartFile getServiceImg() {
        return serviceImg;
    }

    public void setServiceImg(MultipartFile serviceImg) {
        this.serviceImg = serviceImg;
    }

    public String getServiceImgLink() {
        return serviceImgLink;
    }

    public void setServiceImgLink(String serviceImgLink) {
        this.serviceImgLink = serviceImgLink;
    }

    public MultipartFile[] getServiceSpecial() {
        return serviceSpecial;
    }

    public void setServiceSpecial(MultipartFile[] serviceSpecial) {
        this.serviceSpecial = serviceSpecial;
    }

    public List<String> getServiceSpecialLink() {
        return serviceSpecialLink;
    }

    public void setServiceSpecialLink(List<String> serviceSpecialLink) {
        this.serviceSpecialLink = serviceSpecialLink;
    }

    public Integer[] getCityIds() {
        return cityIds;
    }

    public void setCityIds(Integer[] cityIds) {
        this.cityIds = cityIds;
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
}

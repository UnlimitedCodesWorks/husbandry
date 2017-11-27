package xin.yiliya.pojo;

import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

public class ServicePeopleUpdate {

    private Integer servicepeopleid;

    private Integer storeId;

    private MultipartFile sphead;

    private String spheadLink;

    private String spName;

    private String spSex;

    private Date spBirth;

    private String spHeight;

    private String spWeight;

    private String spNation;

    private String spTemplatename;

    private String spPhone;

    private String spOtherinfo;

    private String spRemark;

    public Integer getServicepeopleid() {
        return servicepeopleid;
    }

    public void setServicepeopleid(Integer servicepeopleid) {
        this.servicepeopleid = servicepeopleid;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public MultipartFile getSphead() {
        return sphead;
    }

    public void setSphead(MultipartFile sphead) {
        this.sphead = sphead;
    }

    public String getSpheadLink() {
        return spheadLink;
    }

    public void setSpheadLink(String spheadLink) {
        this.spheadLink = spheadLink;
    }

    public String getSpName() {
        return spName;
    }

    public void setSpName(String spName) {
        this.spName = spName;
    }

    public String getSpSex() {
        return spSex;
    }

    public void setSpSex(String spSex) {
        this.spSex = spSex;
    }

    public Date getSpBirth() {
        return spBirth;
    }

    public void setSpBirth(Date spBirth) {
        this.spBirth = spBirth;
    }

    public String getSpHeight() {
        return spHeight;
    }

    public void setSpHeight(String spHeight) {
        this.spHeight = spHeight;
    }

    public String getSpWeight() {
        return spWeight;
    }

    public void setSpWeight(String spWeight) {
        this.spWeight = spWeight;
    }

    public String getSpNation() {
        return spNation;
    }

    public void setSpNation(String spNation) {
        this.spNation = spNation;
    }

    public String getSpTemplatename() {
        return spTemplatename;
    }

    public void setSpTemplatename(String spTemplatename) {
        this.spTemplatename = spTemplatename;
    }

    public String getSpPhone() {
        return spPhone;
    }

    public void setSpPhone(String spPhone) {
        this.spPhone = spPhone;
    }

    public String getSpOtherinfo() {
        return spOtherinfo;
    }

    public void setSpOtherinfo(String spOtherinfo) {
        this.spOtherinfo = spOtherinfo;
    }

    public String getSpRemark() {
        return spRemark;
    }

    public void setSpRemark(String spRemark) {
        this.spRemark = spRemark;
    }
}

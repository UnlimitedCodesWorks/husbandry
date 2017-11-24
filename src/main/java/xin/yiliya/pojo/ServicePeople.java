package xin.yiliya.pojo;

import java.util.Date;

public class ServicePeople {
    private Integer servicepeopleid;

    private Integer storeId;

    private String spHead;

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

    private Date upTime;

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

    public String getSpHead() {
        return spHead;
    }

    public void setSpHead(String spHead) {
        this.spHead = spHead == null ? null : spHead.trim();
    }

    public String getSpName() {
        return spName;
    }

    public void setSpName(String spName) {
        this.spName = spName == null ? null : spName.trim();
    }

    public String getSpSex() {
        return spSex;
    }

    public void setSpSex(String spSex) {
        this.spSex = spSex == null ? null : spSex.trim();
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
        this.spHeight = spHeight == null ? null : spHeight.trim();
    }

    public String getSpWeight() {
        return spWeight;
    }

    public void setSpWeight(String spWeight) {
        this.spWeight = spWeight == null ? null : spWeight.trim();
    }

    public String getSpNation() {
        return spNation;
    }

    public void setSpNation(String spNation) {
        this.spNation = spNation == null ? null : spNation.trim();
    }

    public String getSpPhone() {
        return spPhone;
    }

    public void setSpPhone(String spPhone) {
        this.spPhone = spPhone == null ? null : spPhone.trim();
    }

    public String getSpOtherinfo() {
        return spOtherinfo;
    }

    public void setSpOtherinfo(String spOtherinfo) {
        this.spOtherinfo = spOtherinfo == null ? null : spOtherinfo.trim();
    }

    public Date getUpTime() {
        return upTime;
    }

    public void setUpTime(Date upTime) {
        this.upTime = upTime;
    }

    public String getSpRemark() {
        return spRemark;
    }

    public void setSpRemark(String spRemark) {
        this.spRemark = spRemark;
    }

    public String getSpTemplatename() {
        return spTemplatename;
    }

    public void setSpTemplatename(String spTemplatename) {
        this.spTemplatename = spTemplatename;
    }
}
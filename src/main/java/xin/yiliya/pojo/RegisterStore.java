package xin.yiliya.pojo;

import org.springframework.web.multipart.MultipartFile;

public class RegisterStore {
    private String registNum;

    private String password;

    private String storeName;

    private String phone;

    private String email;

    private MultipartFile headImg;

    private MultipartFile logoImg;

    private MultipartFile[] aptitudeImgs;

    private String provinceId;

    private String cityId;

    private String areaId;

    private String detailInfo;

    public String getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(String provinceId) {
        this.provinceId = provinceId;
    }

    public String getCityId() {
        return cityId;
    }

    public void setCityId(String cityId) {
        this.cityId = cityId;
    }

    public String getAreaId() {
        return areaId;
    }

    public void setAreaId(String areaId) {
        this.areaId = areaId;
    }

    public String getDetailInfo() {
        return detailInfo;
    }

    public void setDetailInfo(String detailInfo) {
        this.detailInfo = detailInfo;
    }

    public String getRegistNum() {
        return registNum;
    }

    public void setRegistNum(String registNum) {
        this.registNum = registNum;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public MultipartFile getHeadImg() {
        return headImg;
    }

    public void setHeadImg(MultipartFile headImg) {
        this.headImg = headImg;
    }

    public MultipartFile getLogoImg() {
        return logoImg;
    }

    public void setLogoImg(MultipartFile logoImg) {
        this.logoImg = logoImg;
    }

    public MultipartFile[] getAptitudeImgs() {
        return aptitudeImgs;
    }

    public void setAptitudeImgs(MultipartFile[] aptitudeImgs) {
        this.aptitudeImgs = aptitudeImgs;
    }
}

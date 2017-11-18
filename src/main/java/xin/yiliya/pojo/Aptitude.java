package xin.yiliya.pojo;

public class Aptitude {
    private Integer aptitudeid;

    private Integer storeId;

    private String aptitudeImg;

    public Integer getAptitudeid() {
        return aptitudeid;
    }

    public void setAptitudeid(Integer aptitudeid) {
        this.aptitudeid = aptitudeid;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public String getAptitudeImg() {
        return aptitudeImg;
    }

    public void setAptitudeImg(String aptitudeImg) {
        this.aptitudeImg = aptitudeImg == null ? null : aptitudeImg.trim();
    }
}
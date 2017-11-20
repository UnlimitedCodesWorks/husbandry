package xin.yiliya.pojo;

public class ServiceSpecial {
    private Integer spid;

    private Integer offerserviceId;

    private String specialImg;

    public Integer getSpid() {
        return spid;
    }

    public void setSpid(Integer spid) {
        this.spid = spid;
    }

    public Integer getOfferserviceId() {
        return offerserviceId;
    }

    public void setOfferserviceId(Integer offerserviceId) {
        this.offerserviceId = offerserviceId;
    }

    public String getSpecialImg() {
        return specialImg;
    }

    public void setSpecialImg(String specialImg) {
        this.specialImg = specialImg == null ? null : specialImg.trim();
    }
}
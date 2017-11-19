package xin.yiliya.pojo;

import java.io.Serializable;

public class Provinces implements Serializable {

    private static final long serialVersionUID = -7186865862299738725L;

    private Integer proid;

    private String province;

    private String provinceId;

    public String getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(String provinceId) {
        this.provinceId = provinceId;
    }

    public Integer getProid() {
        return proid;
    }

    public void setProid(Integer proid) {
        this.proid = proid;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }
}
package xin.yiliya.pojo;

public class OfferServiceTemplate {
    private Integer servicetemplateid;

    private Integer offerserviceId;

    private String templateDetail;

    private String templateName;

    public Integer getServicetemplateid() {
        return servicetemplateid;
    }

    public void setServicetemplateid(Integer servicetemplateid) {
        this.servicetemplateid = servicetemplateid;
    }

    public Integer getOfferserviceId() {
        return offerserviceId;
    }

    public void setOfferserviceId(Integer offerserviceId) {
        this.offerserviceId = offerserviceId;
    }

    public String getTemplateDetail() {
        return templateDetail;
    }

    public void setTemplateDetail(String templateDetail) {
        this.templateDetail = templateDetail == null ? null : templateDetail.trim();
    }

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName == null ? null : templateName.trim();
    }
}
package xin.yiliya.pojo;

import java.util.Date;

public class FeedbackSimple {
    private Integer feedbackid;

    private OfferService service;

    private Date time;

    private String content;

    public Integer getFeedbackid() {
        return feedbackid;
    }

    public void setFeedbackid(Integer feedbackid) {
        this.feedbackid = feedbackid;
    }

    public OfferService getService() {
        return service;
    }

    public void setService(OfferService service) {
        this.service = service;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}

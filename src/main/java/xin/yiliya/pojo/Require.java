package xin.yiliya.pojo;

import java.util.List;

public class Require {

    private Integer requireid;

    private Integer orderId;

    private String problem;

    private List<RequireContent> requireContents;

    public Integer getRequireid() {
        return requireid;
    }

    public void setRequireid(Integer requireid) {
        this.requireid = requireid;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getProblem() {
        return problem;
    }

    public void setProblem(String problem) {
        this.problem = problem;
    }

    public List<RequireContent> getRequireContents() {
        return requireContents;
    }

    public void setRequireContents(List<RequireContent> requireContents) {
        this.requireContents = requireContents;
    }
}

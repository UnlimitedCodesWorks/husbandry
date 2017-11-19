package xin.yiliya.pojo;

import org.springframework.web.multipart.MultipartFile;

public class RegisterUser {

    private String registNum;

    private String password;

    private String userName;

    private String phone;

    private String email;

    private MultipartFile headImg;

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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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

}

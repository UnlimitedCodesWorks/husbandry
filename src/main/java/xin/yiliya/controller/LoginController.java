package xin.yiliya.controller;

import org.apache.http.protocol.HTTP;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import xin.yiliya.pojo.Store;
import xin.yiliya.pojo.User;
import xin.yiliya.service.StoreService;
import xin.yiliya.service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/login")
public class LoginController {

    @Resource
    private UserService userService;

    @Resource
    private StoreService storeService;

    @Resource
    private HttpSession httpSession;

    @RequestMapping(value = "/user.html",method = RequestMethod.GET)
    public String user(){
        return "login";
    }

    @RequestMapping(value = "/exit",method = RequestMethod.GET)
    public String exit(){
        httpSession.invalidate();
        return "redirect:/index.html";
    }

    @RequestMapping(value = "/userLogin.do",method = RequestMethod.POST)
    public String userLoginDo(String username,String password){
        User user=userService.userLogin(username,password);
        if(user==null){
            return "redirect:/login/user.html";
        }
        else{
            httpSession.setAttribute("userBean",user);
            return "redirect:/index.html";
        }
    }
    @RequestMapping(value = "/storeLogin.do",method = RequestMethod.POST)
    public String storeLogin(String loginName, String password){
        Store store = storeService.login(loginName,password);
        if(store == null){
            return "redirect:/login/user.html";
        }else{
            httpSession.setAttribute("storeBean",store);
            return "redirect:/store/information/"+store.getStoreid();
        }
    }

}

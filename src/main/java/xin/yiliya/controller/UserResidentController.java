package xin.yiliya.controller;

import org.apache.http.protocol.HTTP;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import xin.yiliya.pojo.User;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/userResident")
public class UserResidentController {

    @Resource
    private HttpSession session;

    @RequestMapping(value = "/information.html",method = RequestMethod.GET)
    public String information(Model model){
        User user = (User) session.getAttribute("userBean");
        model.addAttribute("user",user);
        return "residentHome/resident_information";
    }

    @RequestMapping(value = "/security.html",method = RequestMethod.GET)
    public String security(Model model){
        User user = (User) session.getAttribute("userBean");
        model.addAttribute("user",user);
        return "residentHome/resident_security";
    }

    @RequestMapping(value = "/order.html",method = RequestMethod.GET)
    public String order(Model model){
        User user = (User) session.getAttribute("userBean");
        model.addAttribute("user",user);
        return "residentHome/resident_order";
    }

    @RequestMapping(value = "/focus.html",method = RequestMethod.GET)
    public String focus(Model model){
        User user = (User) session.getAttribute("userBean");
        model.addAttribute("user",user);
        return "residentHome/resident_focus";
    }

    @RequestMapping(value = "/refund.html",method = RequestMethod.GET)
    public String refund(Model model){
        User user = (User) session.getAttribute("userBean");
        model.addAttribute("user",user);
        return "residentHome/resident_refund";
    }
}

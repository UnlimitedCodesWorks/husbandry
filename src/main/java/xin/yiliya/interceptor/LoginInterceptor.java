package xin.yiliya.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import xin.yiliya.pojo.User;
import xin.yiliya.service.FeedbackService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {

    @Resource
    private FeedbackService feedbackService;

    public boolean preHandle(HttpServletRequest httpServletRequest,
                             HttpServletResponse httpServletResponse, Object o) throws Exception {
        HttpSession session = httpServletRequest.getSession();
        User user = (User) session.getAttribute("userBean");
        if(user!=null){
            return true;
        }else {
            httpServletResponse.sendRedirect("/login/user.html");
            return false;
        }
    }

    public void postHandle(HttpServletRequest httpServletRequest,
                           HttpServletResponse httpServletResponse,
                           Object o,
                           ModelAndView modelAndView) throws Exception {
        HttpSession session = httpServletRequest.getSession();
        User user = (User) session.getAttribute("userBean");
        Integer userId = user.getUserid();
        modelAndView.addObject("feedbackNum",feedbackService.getUnreadNumByUserId(userId));
    }

    public void afterCompletion(HttpServletRequest httpServletRequest,
                                HttpServletResponse httpServletResponse,
                                Object o, Exception e) throws Exception {

    }
}

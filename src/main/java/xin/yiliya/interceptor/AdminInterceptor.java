package xin.yiliya.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import xin.yiliya.pojo.Admin;
import xin.yiliya.service.AdminService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminInterceptor implements HandlerInterceptor {

    @Resource
    private AdminService adminService;

    public boolean preHandle(HttpServletRequest httpServletRequest,
                             HttpServletResponse httpServletResponse, Object o) throws Exception{
        HttpSession session = httpServletRequest.getSession();
        Admin admin = (Admin) session.getAttribute("adminBean");
        if(admin!=null){
            return true;
        }
        else{
            httpServletResponse.sendRedirect("/manage/login.html");
            return false;
        }
    }

    public void postHandle(HttpServletRequest httpServletRequest,
                           HttpServletResponse httpServletResponse,
                           Object o,
                           ModelAndView modelAndView) throws Exception{
        Integer unPassStoreNum=adminService.getUnpassStoreNum();
        modelAndView.addObject("unPassStoreNum",unPassStoreNum);

    }

    public void afterCompletion(HttpServletRequest httpServletRequest,
                                HttpServletResponse httpServletResponse,
                                Object o, Exception e) throws Exception{

    }

}

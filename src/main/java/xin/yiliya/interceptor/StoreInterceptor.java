package xin.yiliya.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import xin.yiliya.pojo.Store;
import xin.yiliya.pojo.StoreInfo;
import xin.yiliya.service.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class StoreInterceptor implements HandlerInterceptor {

    @Resource
    private StoreService storeService;

    @Resource
    private EvaluateStoreService evaluateStoreService;

    @Resource
    private StoreNewsService storeNewsService;

    @Resource
    private OrderService orderService;

    @Resource
    private ComplainService complainService;

    public boolean preHandle(HttpServletRequest httpServletRequest,
                             HttpServletResponse httpServletResponse, Object o) throws Exception{
        HttpSession session = httpServletRequest.getSession();
        Store store= (Store) session.getAttribute("storeBean");
        if(store!=null){
            return true;
        }
        else{
            httpServletResponse.sendRedirect("/login/user.html");
            return false;
        }
    }

    public void postHandle(HttpServletRequest httpServletRequest,
                           HttpServletResponse httpServletResponse,
                           Object o,
                           ModelAndView modelAndView) throws Exception {
        HttpSession session = httpServletRequest.getSession();
        Store store= (Store) session.getAttribute("storeBean");
        Integer storeId = store.getStoreid();
        StoreInfo storeInfo = storeService.getInfoByStoreId(storeId);
        modelAndView.addObject("storeInfo",storeInfo);
        modelAndView.addObject("grade",evaluateStoreService.getGradeByStoreId(storeId));
        modelAndView.addObject("unReadNewsNum",storeNewsService.getUnreadNumByStoreId(storeId));
        modelAndView.addObject("unReadComplainNum",complainService.getUnreadNumByStoreId(storeId));
        modelAndView.addObject("waitCancelNum",orderService.cancelCount(storeId));
        modelAndView.addObject("waitHandleNum",orderService.handleCount(storeId));
        modelAndView.addObject("waitSureNum",orderService.sureCount(storeId));
    }

    public void afterCompletion(HttpServletRequest httpServletRequest,
                                HttpServletResponse httpServletResponse,
                                Object o, Exception e) throws Exception {

    }

}

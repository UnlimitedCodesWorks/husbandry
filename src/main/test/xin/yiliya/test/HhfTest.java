package xin.yiliya.test;

import com.alibaba.fastjson.JSON;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import xin.yiliya.pojo.Admin;
import xin.yiliya.service.AdminService;

import javax.annotation.Resource;

/**
 * 配置spring和junit整合，junit启动时加载springIOC容器 spring-test,junit
 */
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring配置文件
@ContextConfiguration({"classpath:config/applicationContext.xml"})
public class HhfTest {

    @Resource
    AdminService adminService;

    @Test
    public void test(){
        Admin admin=adminService.AdminLogin("123456","123456");
        System.out.println(JSON.toJSONString(admin,true));
    }
}

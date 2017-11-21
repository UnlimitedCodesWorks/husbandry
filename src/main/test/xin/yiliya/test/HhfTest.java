package xin.yiliya.test;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.IOUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.multipart.MultipartFile;
import xin.yiliya.exception.ImageFormatException;
import xin.yiliya.pojo.*;
import xin.yiliya.service.*;
import xin.yiliya.tool.AliOssTool;

import javax.annotation.Resource;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * 配置spring和junit整合，junit启动时加载springIOC容器 spring-test,junit
 */
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring配置文件
@ContextConfiguration({"classpath:config/applicationContext.xml"})
public class HhfTest {

    @Resource
    AdminService adminService;

    @Autowired
    AliOssTool aliOssTool;

    @Resource
    UserService userService;

    @Autowired
    OrderFormService orderFormService;

    @Autowired
    OrderService orderService;

    @Autowired
    UserConcernService userConcernService;

    @Test
    public void test() throws IOException, ImageFormatException {
        //管理员登录
//        Admin admin=adminService.AdminLogin("123456","123456");
//        System.out.println(JSON.toJSONString(admin,true));

//        File file1 = new File("src/main/test/test.jpg");
//        FileInputStream input1 = new FileInputStream(file1);
//        File file2 = new File("src/main/test/test1.jpg");
//        FileInputStream input2 = new FileInputStream(file2);
//        MultipartFile multipartFile1 = new MockMultipartFile("test.jpg",file1.getName(),"image/jpeg", IOUtils.toByteArray(input1));
//        MultipartFile multipartFile2 = new MockMultipartFile("test1.jpg",file2.getName(),"image/png", IOUtils.toByteArray(input2));
//        MultipartFile[] files = new MultipartFile[2];
//        files[0] = multipartFile1;
//        files[1] = multipartFile2;
//        List<String> links = aliOssTool.putImages(files,"user");
//        for(String link:links){
//            System.out.println(link);
//        }
        //用户注册
//        RegisterUser registerUser=new RegisterUser();
//        registerUser.setRegistNum("12345");
//        registerUser.setPassword("12345");
//        registerUser.setEmail("12345");
//        registerUser.setHeadImg(multipartFile1);
//        registerUser.setPhone("1356777");
//        registerUser.setUserName("uuu");
//        boolean b=userService.userRegister(registerUser);
//        System.out.print(b);

        //用户登录
//        User user=userService.userLogin("12345","12345");
//        System.out.print(JSON.toJSONString(user,true));

        //修改我的信息
//        UpdateUser updateUser=new UpdateUser();
//        updateUser.setUserName("bb");
//        updateUser.setRegistNum("1616161");
//        updateUser.setIntroduce("bbbb");
//        updateUser.setSex("bbaa");
//        updateUser.setBirth(new Date());
//        updateUser.setCommunity("bb");
//        updateUser.setCityId("110200");
//        boolean b=userService.userMyInfoUpdate(updateUser);
//        System.out.print(b);

        //根据服务类型的所有问题和答案
//        List<Problem> allInfo=orderFormService.getAllOrderFormRow("月嫂");
//        System.out.print(JSON.toJSONString(allInfo,true));

        //获取客户全部订单
//        PageInfo<OrderShow> info=orderService.getAllUserOrder(15,1,2);
//        System.out.print(JSON.toJSONString(info,true));

        //获取客户等待派遣订单
//        PageInfo<OrderShow> info=orderService.getAllUserSendOrder(15,1,1);
//        System.out.print(JSON.toJSONString(info,true));

        //获取客户等待确认订单
//        PageInfo<Order> info=orderService.getAllUserSureOrder(15,1,2);
//        System.out.print(JSON.toJSONString(info,true));

        //获取客户等待评价订单
//        PageInfo<Order> info=orderService.getAllUserAssessOrder(15,1,2);
//        System.out.print(JSON.toJSONString(info,true));

        //获取客户关注的服务
//        PageInfo<OfferServiceSimple> info=userConcernService.userConcernServices(15,1,2);
//        System.out.print(JSON.toJSONString(info,true));

        //获取客户关注的供应商
//        PageInfo<StoreInfo> info=userConcernService.userConcernStores(15,2,2);
//        System.out.print(JSON.toJSONString(info,true));

        //获取客户退款订单
//        PageInfo<OrderCancel> info=orderService.getAllUserCancelOrder(15,1,2);
//        System.out.print(JSON.toJSONString(info,true));
    }
}

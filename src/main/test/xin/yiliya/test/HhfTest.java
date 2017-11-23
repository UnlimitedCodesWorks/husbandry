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
import xin.yiliya.dao.RequireMapper;
import xin.yiliya.exception.ImageFormatException;
import xin.yiliya.pojo.*;
import xin.yiliya.service.*;
import xin.yiliya.tool.AliOssTool;

import javax.annotation.Resource;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
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

    @Autowired
    RequireService requireService;

    @Autowired
    RequireMapper requireMapper;

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

        //确认需求表单生成订单order
//        RequireList requires=new RequireList();
//        List<Require> requireList=new ArrayList<Require>();
//        Require require1=new Require();
//        List<RequireContent> contents1=new ArrayList<RequireContent>();
//        RequireContent content11=new RequireContent();
//        RequireContent content12=new RequireContent();
//        Require require2=new Require();
//        List<RequireContent> contents2=new ArrayList<RequireContent>();
//        RequireContent content21=new RequireContent();
//        RequireContent content22=new RequireContent();
//        Require require3=new Require();
//        List<RequireContent> contents3=new ArrayList<RequireContent>();
//        RequireContent content31=new RequireContent();
//        RequireContent content32=new RequireContent();
//        require1.setProblem("问题1");
//        content11.setContent("答案11");
//        content12.setContent("答案12");
//        contents1.add(content11);
//        contents1.add(content12);
//        require1.setRequireContents(contents1);
//        require2.setProblem("问题2");
//        content21.setContent("答案21");
//        content22.setContent("答案22");
//        contents2.add(content21);
//        contents2.add(content22);
//        require2.setRequireContents(contents2);
//        require3.setProblem("问题3");
//        content31.setContent("答案31");
//        content32.setContent("答案32");
//        contents3.add(content31);
//        contents3.add(content32);
//        require3.setRequireContents(contents3);
//        requireList.add(require1);
//        requireList.add(require2);
//        requireList.add(require3);
//        requires.setServiceId(7);
//        requires.setRequireList(requireList);
//        Integer integer=requireService.addRequireOrder(15,requires);
//        System.out.print(integer);

        //确认订单后将问题，选中的答案都插入require表
//        Boolean b=requireService.addRequires(integer,requires);
//        System.out.print(b);
    }
}

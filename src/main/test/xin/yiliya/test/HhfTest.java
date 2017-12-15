package xin.yiliya.test;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import net.sf.json.JSONObject;
import org.apache.commons.io.IOUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.multipart.MultipartFile;
import xin.yiliya.dao.OfferServiceMapper;
import xin.yiliya.dao.RequireMapper;
import xin.yiliya.dao.ServicePeopleMapper;
import xin.yiliya.exception.ImageFormatException;
import xin.yiliya.pojo.*;
import xin.yiliya.service.*;
import xin.yiliya.tool.AliOssTool;

import javax.annotation.Resource;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.Map;

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

    @Autowired
    ServicePeopleService servicePeopleService;

    @Autowired
    ServicePeopleMapper servicePeopleMapper;

    @Autowired
    OfferServiceService offerServiceService;

    @Autowired
    OfferServiceMapper offerServiceMapper;

    @Test
    public void test() throws IOException, ImageFormatException, InvocationTargetException, IllegalAccessException {
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
//        User user=userService.userLogin("1111","1111");
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
//        PageInfo<OrderShow> info=orderService.getAllUserOrder(15,2,1);
//        System.out.print(JSON.toJSONString(info,true));

        //获取客户等待派遣订单
//        PageInfo<OrderShow> info=orderService.getAllUserSendOrder(15,1,2);
//        System.out.print(JSON.toJSONString(info,true));

        //获取客户等待确认订单
//        PageInfo<OrderShow> info=orderService.getAllUserSureOrder(15,1,2);
//        System.out.print(JSON.toJSONString(info,true));

        //获取客户等待评价订单
//        PageInfo<OrderShow> info=orderService.getAllUserAssessOrder(15,1,2);
//        System.out.print(JSON.toJSONString(info,true));

        //获取客户关注的服务
//        PageInfo<OfferServiceSimple> info=userConcernService.userConcernServices(2,1,2);
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

        //获取商家待处理订单
//        PageInfo<OrderSimple> info=orderService.getAllStoreHandleOrder(1,1,2);
//        System.out.print(JSON.toJSONString(info,true));

        //获取商家待确认订单
//        PageInfo<OrderSimple> info=orderService.getAllStoreSureOrder(5,1,2);
//        System.out.print(JSON.toJSONString(info,true));

        //获取商户待退款订单
//        PageInfo<OrderCancel> info=orderService.getAllStoreCancelOrder(5,1,2);
//        System.out.print(JSON.toJSONString(info,true));

        //获取商户待已完成订单
//        PageInfo<OrderSimple> info=orderService.getAllStoreFinishOrder(5,2,2);
//        System.out.print(JSON.toJSONString(info,true));

        //客户撤销订单
//        Cancel cancel=new Cancel();
//        cancel.setUserId(15);
//        cancel.setReason("这东西不好");
//        cancel.setOrderId(2);
//        Boolean b=orderService.userCancelToOrder(cancel);
//        System.out.print(b);

        //客户查看服务进展
//        PageInfo<ServicePeople> info=orderService.getOrderServicePeople(11,1,1);
//        System.out.print(JSON.toJSONString(info,true));

        //客户删除订单
//        Boolean b=orderService.userDeleteOrder(1);
//        System.out.print(b);

        //客户确认订单
//        Boolean b=orderService.userSureToOrder(12);
//        System.out.print(b);

        //商户待退款数量
//        int n=orderService.cancelCount(5);
//        System.out.print(n);

        //商户待处理订单数量
//        int n=orderService.handleCount(5);
//        System.out.print(n);

        //商户待确认订单数量
//        int n=orderService.sureCount(5);
//        System.out.print(n);

        //获取商家订单需求
//        List<Require> requires=orderService.getUserRequires(10);
//        System.out.print(JSON.toJSONString(requires,true));

        //某服务类型服务订单完成的次数(不包括退款)
//        int n=orderService.getServiceTypeFinish(3);
//        System.out.print(n);

        //厂商所有服务的成交量总和(不包括退款)
//        int n=orderService.getStoreServiceFinish(5);
//        System.out.print(n);

        //商户通过客户退款
//        int [] orderId={2,16,17};
//        Boolean b=orderService.storeSureCancelOrder(orderId);
//        System.out.print(b);

        //创建服务人员模板
//        File file1 = new File("src/main/test/test.jpg");
//        FileInputStream input1 = new FileInputStream(file1);
//        MultipartFile multipartFile1 = new MockMultipartFile("test.jpg",file1.getName(),"image/jpeg", IOUtils.toByteArray(input1));
//
//        ServicePeopleAdd servicePeopleAdd=new ServicePeopleAdd();
//        servicePeopleAdd.setStoreId(2);
//        servicePeopleAdd.setSphead(multipartFile1);
//        servicePeopleAdd.setSpName("hx");
//        servicePeopleAdd.setSpSex("男");
//        servicePeopleAdd.setSpBirth(new Date());
//        servicePeopleAdd.setSpHeight("183");
//        servicePeopleAdd.setSpWeight("75");
//        servicePeopleAdd.setSpNation("汉族");
//        servicePeopleAdd.setSpRemark("大量时间");
//        servicePeopleAdd.setSpTemplatename("我是模板3");
//        servicePeopleAdd.setSpPhone("1300000007703");
//        servicePeopleAdd.setSpOtherinfo("我是衢州人");
//
//        Integer n=servicePeopleService.addServicePeopleTemplate(servicePeopleAdd);
//        System.out.print(n);

        //获取供应商服务人员模板  返回服务人员模板详情bean   可分页
//        PageInfo<ServicePeople> info=servicePeopleService.getAllServicePeopleTemplateByStoreId(1,1,2);
//        System.out.print(JSON.toJSONString(info,true));

        //根据服务人员模板id查询单个服务人员模板bean
//        ServicePeople servicePeople=servicePeopleService.getServicePeopleTemplateById(14);
//        System.out.print(JSON.toJSONString(servicePeople,true));

        //删除服务人员模板
//        boolean b=servicePeopleService.deleteServicePeopleTemplate(14);
//        System.out.print(b);

        //修改一个服务人员模板
//        File file1 = new File("src/main/test/test1.jpg");
//        FileInputStream input1 = new FileInputStream(file1);
//        MultipartFile multipartFile1 = new MockMultipartFile("test.jpg",file1.getName(),"image/jpeg", IOUtils.toByteArray(input1));
//
//        ServicePeopleUpdate servicePeopleUpdate=new ServicePeopleUpdate();
//        servicePeopleUpdate.setServicepeopleid(15);
//        servicePeopleUpdate.setSphead(multipartFile1);
//        servicePeopleUpdate.setSpName("wuliafeng");
//
//        Boolean b=servicePeopleService.updateServicePeopleTemlate(servicePeopleUpdate);
//        System.out.print(b);

        //?????????????

        //根据服务人员名字显示模板
//        ServicePeople servicePeople=servicePeopleService.getServicePeople("aaa");
//        System.out.print(JSON.toJSONString(servicePeople,true));

        //供应商派遣服务人员
//        OrderPeople orderPeople=new OrderPeople();
//        orderPeople.setOrderId(11);
//        orderPeople.setSpId(15);
//        int n=orderService.dispatcheServicePeople(orderPeople);
//        System.out.print(n);

        //获取某年每月的订单成交量
//        Map<Integer,Integer> orderMap=adminService.getOrderNumPerYear("2016");
//        System.out.print(JSON.toJSONString(orderMap,true));

        //获取家政系统实时市场价
//        Map<String, Float> servicePrice=adminService.getRealTimeMarketPrice();
//        System.out.print(servicePrice);
//        JSONObject myJson=JSONObject.fromObject(adminService.getRealTimeMarketPrice());
//        System.out.print(myJson);

        //获取服务的详细信息
//        OfferServiceDetail offerServiceDetail=offerServiceService.getOfferServiceDetailByServiceId(1);
//        System.out.print(JSON.toJSONString(offerServiceDetail,true));

        //分页BUG
//        System.out.print(JSON.toJSONString(adminService.getStoresByGrade((float)6,1,2),true));
    }
}

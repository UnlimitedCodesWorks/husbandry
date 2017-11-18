package xin.yiliya.test;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.ObjectMetadata;
import com.aliyun.oss.model.PutObjectResult;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.IOException;

/**
 * 配置spring和junit整合，junit启动时加载springIOC容器 spring-test,junit
 */
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring配置文件
@ContextConfiguration({"classpath:config/applicationContext.xml"})
public class AliOss {

    //oss地址：http://husbandry.oss-cn-shanghai.aliyuncs.com/
    //开发文档：https://help.aliyun.com/document_detail/32013.html?spm=5176.doc32012.6.665.QQkxtY
    //商家空间名store
    //用户空间名user
    //管理员空间名admin
    @Autowired
    private OSSClient ossClient;
    private final static String BUCKETNAME = "husbandry";
    private final static String ENDPOINT = "http://husbandry.oss-cn-shanghai.aliyuncs.com/";
    //上传文件
    @Test
    public void putFile(){
        //假如是一个SpringMvc传来的MultipartFile
        MultipartFile file = null;
        //上传至商家空间store
        String fileName = "store/"+file.getName();
        try {
            PutObjectResult result =ossClient.putObject(BUCKETNAME,fileName,new ByteArrayInputStream(file.getBytes()));
            //打印上传结果
            System.out.println(result.getETag());
//            若上传是图片，则如下
//            ObjectMetadata meta = new ObjectMetadata();
//            设置contentType为指定MIME格式，如图片jpg格式
//            meta.setContentType("image/jpeg");
//            ossClient.putObject(BUCKETNAME,fileName,new ByteArrayInputStream(file.getBytes()),meta);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //图片的http连接为
        String link = ENDPOINT+fileName;
    }
    @Test
    public void test(){
        String content = "Hello OSS";
        PutObjectResult result = ossClient.putObject(BUCKETNAME,"store/test",new ByteArrayInputStream(content.getBytes()));
        //打印上传结果
        System.out.println(result.getETag());
    }
}

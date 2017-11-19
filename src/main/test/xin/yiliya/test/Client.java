package xin.yiliya.test;

import com.alibaba.fastjson.JSON;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.io.IOUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.multipart.MultipartFile;
import xin.yiliya.dao.StoreMapper;
import xin.yiliya.exception.ImageFormatException;
import xin.yiliya.pojo.Store;
import xin.yiliya.service.RegionService;
import xin.yiliya.service.StoreService;
import xin.yiliya.tool.AliOssTool;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * 配置spring和junit整合，junit启动时加载springIOC容器 spring-test,junit
 */
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring配置文件
@ContextConfiguration({"classpath:config/applicationContext.xml"})
public class Client {

    @Autowired
    AliOssTool aliOssTool;

    @Autowired
    RegionService regionService;
    @Test
    public void test() throws IOException, ImageFormatException {
        File file1 = new File("src/main/test/test.jpg");
        FileInputStream input1 = new FileInputStream(file1);
        File file2 = new File("src/main/test/test1.png");
        FileInputStream input2 = new FileInputStream(file2);
        MultipartFile multipartFile1 = new MockMultipartFile("test.jpg",file1.getName(),"image/jpeg", IOUtils.toByteArray(input1));
        MultipartFile multipartFile2 = new MockMultipartFile("test1.png",file2.getName(),"image/png", IOUtils.toByteArray(input2));
        MultipartFile[] files = new MultipartFile[2];
        files[0] = multipartFile1;
        files[1] = multipartFile2;
        List<String> links = aliOssTool.putImages(files,"store");
        for(String link:links){
            System.out.println(link);
        }
    }
}

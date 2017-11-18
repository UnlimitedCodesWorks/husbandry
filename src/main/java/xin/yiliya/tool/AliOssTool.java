package xin.yiliya.tool;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.ObjectMetadata;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import xin.yiliya.exception.ImageFormatException;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class AliOssTool {

    private final static String BUCKETNAME = "husbandry";
    private final static String ENDPOINT = "http://husbandry.oss-cn-shanghai.aliyuncs.com/";

    @Autowired
    OSSClient ossClient;

    public String putImage(MultipartFile file,String nameSpace) throws ImageFormatException, IOException {
        String fileName = file.getName();
        String suffix = fileName.substring(fileName.lastIndexOf(".")+1);
        ObjectMetadata meta = new ObjectMetadata();
        if(suffix.equals("jpg")||suffix.equals("jpeg")||suffix.equals("jpe")){
            meta.setContentType("image/jpeg");
        }else if(suffix.equals("gif")){
            meta.setContentType("image/gif");
        }else if(suffix.equals("png")){
            meta.setContentType("image/png");
        }else{
            throw new ImageFormatException("不能上传除jpg，gif，png以外的图片或文件");
        }
        StringBuffer position = new StringBuffer(nameSpace);
        position.append("/"+fileName);
        ossClient.putObject(BUCKETNAME, String.valueOf(position),new ByteArrayInputStream(file.getBytes()),meta);
        StringBuffer link = new StringBuffer(ENDPOINT);
        link.append(position);
        return String.valueOf(link);
    }

    public List<String> putImages(MultipartFile[] files,String nameSpace) throws IOException, ImageFormatException {
            List<String> links = new LinkedList<String>();
            for (MultipartFile file : files) {
            String link = putImage(file, nameSpace);
            links.add(link);
             }
            return links;
    }
}

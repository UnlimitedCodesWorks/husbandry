package xin.yiliya.tool;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.OSSObjectSummary;
import com.aliyun.oss.model.ObjectListing;
import com.aliyun.oss.model.ObjectMetadata;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import xin.yiliya.exception.ImageFormatException;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

public class AliOssTool {

    private final static String BUCKETNAME = "husbandry";
    private final static String ENDPOINT = "http://husbandry.oss-cn-shanghai.aliyuncs.com/";

    @Autowired
    OSSClient ossClient;

    //将单个图片传入指定目录
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
        position.append("/").append(fileName);
        ossClient.putObject(BUCKETNAME, String.valueOf(position),new ByteArrayInputStream(file.getBytes()),meta);
        StringBuffer link = new StringBuffer(ENDPOINT);
        link.append(position);
        return String.valueOf(link);
    }

    //将多个图片传入指定目录
    public List<String> putImages(MultipartFile[] files,String nameSpace) throws IOException, ImageFormatException {
            List<String> links = new LinkedList<String>();
            for (MultipartFile file : files) {
            String link = putImage(file, nameSpace);
            links.add(link);
             }
            return links;
    }

    //列出目录下的文件
    public String listFiles(String nameSpace){
        StringBuffer files = new StringBuffer();
        ObjectListing objectListing = ossClient.listObjects(BUCKETNAME, nameSpace+"/");
        List<OSSObjectSummary> sums = objectListing.getObjectSummaries();
        for (OSSObjectSummary s : sums) {
            String fileName = s.getKey();
            fileName = fileName.substring(fileName.lastIndexOf("/")+1);
            files.append(fileName).append("\t");
        }
        return String.valueOf(files);
    }

}

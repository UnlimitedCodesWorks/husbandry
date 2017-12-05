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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

public class AliOssTool {

    private final static String BUCKETNAME = "husbandry";
    private final static String ENDPOINT = "http://husbandry.oss-cn-shanghai.aliyuncs.com/";

    @Autowired
    OSSClient ossClient;

    //将单个图片传入指定目录
    public String putImage(MultipartFile file,String nameSpace) throws ImageFormatException, IOException {
        String fileName = file.getOriginalFilename();
        String suffix = fileName.substring(fileName.lastIndexOf(".")+1);
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
        String date = df.format(new Date());
        String uuid = UUID.randomUUID().toString().replaceAll("-", "").substring(0,6);
        StringBuilder imageName = new StringBuilder(date+uuid);
        ObjectMetadata meta = new ObjectMetadata();
        if(suffix.equals("jpg")||suffix.equals("jpeg")||suffix.equals("jpe")){
            meta.setContentType("image/jpeg");
            imageName.append(".jpg");
        }else if(suffix.equals("gif")){
            meta.setContentType("image/gif");
            imageName.append(".gif");
        }else if(suffix.equals("png")){
            meta.setContentType("image/png");
            imageName.append(".png");
        }else{
            throw new ImageFormatException("不能上传除jpg，gif，png以外的图片或文件");
        }
        StringBuffer position = new StringBuffer(nameSpace);
        position.append("/").append(imageName);
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

    //根据文件名删除文件
    public Boolean deleteFile(String fileName,String nameSpace){
        try{
            String key = nameSpace+"/"+fileName;
            ossClient.deleteObject(BUCKETNAME,key);
            return true;
        }catch (Exception e){
            return false;
        }

    }

    //根据图片链接删除文件
    public Boolean deleteFileByLink(String link){
        try{
            String[] strings = link.split(ENDPOINT);
            String key = strings[1];
            ossClient.deleteObject(BUCKETNAME,key);
            return true;
        }catch (Exception e){
            return false;
        }
    }

}

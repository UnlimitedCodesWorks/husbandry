package xin.yiliya.test;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 配置spring和junit整合，junit启动时加载springIOC容器 spring-test,junit
 */
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring配置文件
@ContextConfiguration({"classpath:config/applicationContext.xml"})
public class RedisTest {

    //使用redisTemplate对redis操作
    //这里使用的是StringRedisTemplate，默认String序列化
    //文档链接：http://www.jianshu.com/p/7bf5dc61ca06
    @Autowired
    StringRedisTemplate stringRedisTemplate;

    //这里使用的是RedisTemplate，默认JDK序列化
    //若想将JDK序列化改成String序列化，则如下代码：
    //RedisSerializer<String> stringSerializer = new StringRedisSerializer();
    //redisTemplate.setKeySerializer(stringSerializer );
    //redisTemplate.setValueSerializer(stringSerializer );
    // redisTemplate.setHashKeySerializer(stringSerializer );
    // redisTemplate.setHashValueSerializer(stringSerializer );
    //redisTemplate.set***(stringSerializer);
    @Autowired
    RedisTemplate<String,Object> redisTemplate;

    //向redis加入键值对
    //插入的是字符串故使用默认字符串序列化的stringRedisTemplate
    @Test
    public void redisString(){
        ValueOperations<String, String> vop = stringRedisTemplate.opsForValue();
        String key = "redis";
        String v = "hello";
        vop.set(key,v);
        String value = vop.get(key);
        System.out.println(value);
    }

    //想redis加入链表
    //插入的是对象故使用默认对象序列化的redisTemplate
    @Test
    public void redisList(){
        ListOperations<String,Object> list = redisTemplate.opsForList();
        List<Object> stringList = new ArrayList<Object>();
        List<Object> getList;
        //插入对象集合
        stringList.add("1");
        stringList.add("2");
        stringList.add("3");
        list.rightPushAll("myList",stringList);
        //获取对象集合
        getList = list.range("myList",0,-1);
        Iterator<Object> iterator = getList.iterator();
        while(iterator.hasNext()){
            String out = (String) iterator.next();
            System.out.println(out);
        }
    }
}

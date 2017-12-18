package xin.yiliya.tool;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class StoreJudge {

    public static String handle(Date registTime) throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy");
        Integer formatTime = Integer.valueOf(simpleDateFormat.format(registTime));
        Integer nowTime = Integer.valueOf(simpleDateFormat.format(new Date()));
        if(nowTime-formatTime<=1){
            return "新晋商家";
        }else {
            return "老牌商家";
        }

    }
}

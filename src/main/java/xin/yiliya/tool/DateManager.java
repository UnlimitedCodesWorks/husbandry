package xin.yiliya.tool;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateManager {

    public static Integer getDaysByYearAndMonth(int year,int month){
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR,year);
        calendar.set(Calendar.MONTH,month-1);
        calendar.set(Calendar.DATE,1);
        calendar.roll(Calendar.DATE,-1);
        return calendar.get(Calendar.DATE);
    }
}

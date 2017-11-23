package xin.yiliya.tool;

public class GradeJudge {

    public static String judge(float grade){
        if(grade>0 && grade<3){
            return "红色预警";
        }else if(grade>=3 && grade<6){
            return "黄色预警";
        }else if(grade>=6 && grade<8){
            return "正常";
        }else if(grade ==0){
            return "";
        }
        return "优秀";
    }
}

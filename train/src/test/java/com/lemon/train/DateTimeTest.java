package com.lemon.train;


import com.lemon.train.common.TimeHandle;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

@SpringBootTest
public class DateTimeTest {

    @Autowired
    TimeHandle timeHandle;

    @Test
    public void test1(){
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(dateFormat.format(date));
    }

    @Test
    public void test2(){
        Date date=new Date(); //取时间
        System.out.println(date);
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(date);
        calendar.add(calendar.DATE,1); //把日期往后增加一天,整数  往后推,负数往前移动
        date=calendar.getTime(); //这个时间就是日期往后推一天的结果
        System.out.println(date);
    }

    @Test
    public void test3(){

    }
}

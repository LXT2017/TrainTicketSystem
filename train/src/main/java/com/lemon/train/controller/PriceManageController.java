package com.lemon.train.controller;


import com.lemon.train.common.ResponseResult;
import com.lemon.train.entity.Holiday;
import com.lemon.train.entity.Pricemanage;
import com.lemon.train.service.PriceManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("price")
public class PriceManageController {

    @Autowired
    PriceManageService priceManageService;

    /**
     * 查询
     * @return
     */
    @GetMapping("/getdiscount")
    public ResponseResult getDiscount(){
        return priceManageService.getDiscount();
    }

    /**
     * 更新折扣
     */
    @PostMapping("/updatediscount")
    public ResponseResult updateDiscount(@RequestBody Pricemanage priceManage){
        System.out.println(priceManage);
        return priceManageService.updateDiscount(priceManage);
    }

    /**
     * 发布单一节假日
     */
    @PostMapping("/postsingleholiday")
    public ResponseResult postSingleHoliday(@RequestBody Holiday holiday){
        System.out.println(holiday);
        return priceManageService.postSingleHoliday(holiday);
    }

    /**
     * 发布一段时间的节假日
     */
    @PostMapping("/postmultipleholiday")
    public ResponseResult postMultipleHoliday(@RequestBody Map map) throws ParseException {

        int status = Integer.parseInt((String) map.get("status"));
        List<String> vacation = (List<String>) map.get("vacation");
        SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd" );
        Date start = sdf.parse(vacation.get(0));
        Date end = sdf.parse(vacation.get(1));
        return priceManageService.postMultipleHoliday(start,end,status);
    }


    /**
     * 当天交易额
     */
    @GetMapping("/gettodaytotalprice")
    public ResponseResult getTodayTotalPrice(String orderdate) throws ParseException {
        SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd" );
        Date odate = sdf.parse(orderdate);
        return priceManageService.getTodayTotalPrice(odate);
    }
}

package com.lemon.train.service.impl;


import com.lemon.train.common.ResponseResult;
import com.lemon.train.common.TimeHandle;
import com.lemon.train.entity.Holiday;
import com.lemon.train.entity.Pricemanage;
import com.lemon.train.mapper.HolidayMapper;
import com.lemon.train.service.PriceManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.util.*;

@Service
public class PriceManageServiceImpl implements PriceManageService {
    @Autowired
    HolidayMapper holidayMapper;

    @Override
    public ResponseResult getDiscount() {
        Pricemanage priceManage = holidayMapper.getDiscount();
        return new ResponseResult(200,"sucess",priceManage);
    }

    @Override
    public ResponseResult updateDiscount(Pricemanage priceManage) {
        priceManage.setId(1);
        System.out.println(priceManage);
        holidayMapper.updateDiscountById(priceManage);
        return new ResponseResult(200,"suceess",null);
    }

    @Override
    public ResponseResult postSingleHoliday(Holiday holiday) {
        int i = holidayMapper.insert(holiday);
        if(i==0){
            return new ResponseResult(400,"fail",400);
        }
        return new ResponseResult(200,"secuss",200);
    }

    @Override
    @Transactional
    public ResponseResult postMultipleHoliday(Date start, Date end, int status) throws ParseException {

        int interval = TimeHandle.getDayDiffer(start,end);
        Date date = start;
        Holiday holiday = new Holiday();
        holiday.setStatus(status);
        holiday.setVacation(start);
        int result = holidayMapper.insert(holiday);
        Calendar calendar = new GregorianCalendar();
        for (int i = 0; i < interval; i++) {
            calendar.setTime(date);
            calendar.add(Calendar.DATE,1);
            date=calendar.getTime();
            holiday.setVacation(date);
            holidayMapper.insert(holiday);
        }

        return new ResponseResult(200,"success",null);
    }

    /**
     * 统计当天成交额
     * @param traindates
     * @return
     */
    @Override
    public ResponseResult getTodayTotalPrice(Date traindates) {
        Map map = new HashMap<>(16);
        map.put("traindates",traindates);
        holidayMapper.getToalPrice(map);
        return new ResponseResult(200,"success",map.get("totalprice"));
    }


}

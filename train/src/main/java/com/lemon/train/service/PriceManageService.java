package com.lemon.train.service;

import com.lemon.train.common.ResponseResult;
import com.lemon.train.entity.Holiday;
import com.lemon.train.entity.Pricemanage;

import java.text.ParseException;
import java.util.Date;

public interface PriceManageService {

    ResponseResult getDiscount();

    ResponseResult updateDiscount(Pricemanage priceManage);

    ResponseResult postSingleHoliday(Holiday holiday);

    ResponseResult postMultipleHoliday(Date start, Date end, int status) throws ParseException;

    ResponseResult getTodayTotalPrice(Date odate);
}

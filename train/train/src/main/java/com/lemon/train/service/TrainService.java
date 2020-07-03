package com.lemon.train.service;

import com.lemon.train.common.ResponseResult;
import com.lemon.train.entity.Traininfos;

import java.util.Date;
import java.util.List;


public interface TrainService {
    ResponseResult trainTicketQuery(String startcity, String endcity, Date traindate,Integer traintype);

    ResponseResult addTrain(Traininfos traininfos);

    ResponseResult queryTrains();

    ResponseResult departTrain(Integer id,Date traindate);

    ResponseResult departTrainsSelective(List<Integer> idlist, Date traindate);

    ResponseResult holidayDiscount(Date date);
}

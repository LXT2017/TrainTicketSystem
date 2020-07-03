package com.lemon.train.service.impl;

import com.lemon.train.common.ResponseResult;
import com.lemon.train.entity.*;
import com.lemon.train.mapper.*;
import com.lemon.train.service.TrainService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class TrainServiceImpl implements TrainService {

    @Autowired
    TraininfosMapper traininfosMapper;
    @Autowired
    TrainMapper trainMapper;
    @Autowired
    TraininfoMapper traininfoMapper;
    @Autowired
    TrainticketMapper trainticketMapper;
    @Autowired
    TrainstateMapper trainstateMapper;
    @Autowired
    HolidayMapper holidayMapper;

    //火车票查询
    @Override
    public ResponseResult trainTicketQuery(String startcity, String endcity, Date traindate,Integer traintype) {
        TraininfosExample traininfosExample = new TraininfosExample();
        TraininfosExample.Criteria criteria = traininfosExample.createCriteria();
        if(traintype==0){
            criteria.andTypeEqualTo(traintype);
        }
        criteria.andStartcityEqualTo(startcity);
        criteria.andEndcityEqualTo(endcity);
        criteria.andTicketdateEqualTo(traindate);
        List<Traininfos> traininfos = traininfosMapper.selectByExample(traininfosExample);
        return new ResponseResult(200,"suc",traininfos);
    }


    /**
     * 查询节假日价格折扣
     * @param date
     * @return
     */
    @Override
    @Transactional
    public ResponseResult holidayDiscount(Date date) {
        int status = 0;


        //节假日判断
        Holiday holiday = holidayMapper.selectByPrimaryKey(date);
        if(null !=holiday){
            status=holiday.getStatus();
        }//判断是否是周末
        else{
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            if(cal.get(Calendar.DAY_OF_WEEK)==Calendar.SUNDAY) {
                status = 1;
            }
        }

        Map map = new HashMap(16);
        map.put("status",status);
        //折扣率
        double discount = holidayMapper.getSpecialDiscount(map);

        return new ResponseResult(200,"success",discount);
    }




    // 火车新增
    @Override
    @Transactional
    public ResponseResult addTrain(Traininfos traininfos) {
        Train train = new Train();
        train.setName(traininfos.getName());
        train.setType(traininfos.getType());


        trainMapper.insertSelective(train);
        Trainstate trainstate = new Trainstate();

        //新增火车状态
        trainstate.setTrainId(train.getId());
        trainstate.setStatus(1);
        trainstateMapper.insertSelective(trainstate);


        Traininfo traininfo = new Traininfo();
        traininfo.setTrainId(train.getId());
        BeanUtils.copyProperties(traininfos,traininfo);

        //获取时间间隔
        Date date1=traininfo.getEndtime();
        Date date2=traininfo.getStarttime();
        Long betweentime = (date1.getTime()-date2.getTime())/1000;
        traininfo.setDuration(betweentime/3600+"小时"+betweentime/60+"分钟");

        traininfoMapper.insertSelective(traininfo);
        return new ResponseResult(200,"插入成功",null);
    }

    @Override
    public ResponseResult queryTrains() {
        // List<Traininfo> traininfos = traininfoMapper.selectByExample(null);
        List<Map> maps = traininfoMapper.selectTrainInfo();
        System.out.println(maps);
        return new ResponseResult(200,"success",maps);
        // return null;
    }

    @Override
    @Transactional
    public ResponseResult departTrain(Integer id,Date traindate) {
        System.out.println(id);
        System.out.println(traindate);
        if(id==0){
            Trainticket trainticket=null;
            List<Traininfo> traininfos = traininfoMapper.selectByExample(null);
            System.out.println(traininfos);
            for (Traininfo traininfo:traininfos) {
                trainticket=new Trainticket(traininfo.getFnum(),traininfo.getSnum(),traindate,traininfo.getTrainId());
                trainticketMapper.insertSelective(trainticket);
            }
            return new ResponseResult(200,"success",null);
        }
        Traininfo traininfo = traininfoMapper.selectSingleTrainInfo(id);
        Trainticket trainticket = new Trainticket(traininfo.getFnum(),traininfo.getSnum(),traindate,id);
        int i = trainticketMapper.insertSelective(trainticket);
        return new ResponseResult(200,"success",null);
    }


    @Override
    @Transactional
    public ResponseResult departTrainsSelective(List<Integer> idlist, Date traindate) {
        List<Traininfo> traininfos = traininfoMapper.selectTrainInfoByIdlist(idlist);
        Trainticket trainticket=null;
        for (Traininfo traininfo:traininfos) {
            trainticket=new Trainticket(traininfo.getFnum(),traininfo.getSnum(),traindate,traininfo.getTrainId());
            trainticketMapper.insertSelective(trainticket);
        }
        return new ResponseResult(200,"success",null);
    }


}

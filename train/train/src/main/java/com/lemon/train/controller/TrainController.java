package com.lemon.train.controller;

import com.lemon.train.common.ResponseResult;
import com.lemon.train.entity.Traininfos;
import com.lemon.train.service.TrainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("train")
public class TrainController {

    @Autowired
    TrainService trainService;

    /**
     * 车票查询
     * @return
     */
    @GetMapping("/trainticketquery")
    public ResponseResult trainTicketQuery(String startcity, String endcity, String traindate,Integer traintype) throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd");
        Date date =  formatter.parse(traindate);
        return trainService.trainTicketQuery(startcity, endcity, date,traintype);
    }


    /**
     * 节假日价格折扣查询
     */
    @GetMapping("/holidaydiscount")
    public ResponseResult holidayDiscount(String traindate) throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd");
        Date date =  formatter.parse(traindate);
        return trainService.holidayDiscount(date);
    }






    /**
     * 管理员端
     * 火车新增
     */
    @PostMapping("addtrain")
    public ResponseResult addTrain(@RequestBody Traininfos traininfos){
        return trainService.addTrain(traininfos);
    }

    /**
     * 管理员火车信息查询
     */
    @GetMapping("/querytrains")
    public ResponseResult queryTrains(){
        return trainService.queryTrains();

    }


    /**
     * 管理员单个火车发布或者全部发布
     */
    @PostMapping("/departtrains")
    public ResponseResult departTrains(Integer id, String traindate) throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd");
        Date date =  formatter.parse(traindate);
        return trainService.departTrain(id,date);
    }

    /**
     * 管理多个火车表的发布
     */
    @PostMapping("/departtrainsselective")
    public ResponseResult departTrainsSelective(@RequestBody Map map) throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd");
        Date date =  formatter.parse((String) map.get("traindate"));
        return trainService.departTrainsSelective((List<Integer>)map.get("idlist"),date);
    }
}

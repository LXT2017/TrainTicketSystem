package com.lemon.train.controller;


import com.lemon.train.common.ResponseResult;
import com.lemon.train.entity.Orderinfo;
import com.lemon.train.entity.Orders;
import com.lemon.train.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@RestController
@RequestMapping("order")
public class OrderController {


    @Autowired
    OrderService orderService;

    /**
     * 订单查询
     * @param orders
     * @return
     */
    @PostMapping("/submitorder")
    public ResponseResult submitOrder(@RequestBody Orders orders){
        return orderService.submitOrder(orders);
    }



    /**
     * 查询所有订单
     * @param orderId
     * @return
     */
    @GetMapping("/queryorders")
    public ResponseResult queryOrders(Integer orderId){
        return orderService.queryOrders(orderId);
    }


    /**
     * 查询单一订单
     * @param id
     * @return
     */
    @GetMapping("/getdetailorder")
    public ResponseResult getDetailOrder(Integer id){
        return orderService.getDetailOrder(id);
    }


    /**
     * 删除订单
     */
    @PostMapping("/delorder")
    public ResponseResult delOrder(Integer id){
        return orderService.delOrder(id);
    }

    /**
     * 订单退票
     */
    @PostMapping("/deleteorder")
    public ResponseResult deleteOrder(@RequestBody Orderinfo orderinfo){
        return orderService.deleteOrder(orderinfo);
    }

    /**
     * 订单改签
     */
    @PostMapping("/changeticket")
    public ResponseResult changeTicket(@RequestBody Map map) throws ParseException {
        int trainid = (int) map.get("trainid");
        SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd");
        Date date =  formatter.parse((String) map.get("traindate"));
        int orderid=(int) map.get("orderid");
        return orderService.changeTicket(trainid,date,orderid);
    }
}

package com.lemon.train.service;

import com.lemon.train.common.ResponseResult;
import com.lemon.train.entity.Orderinfo;
import com.lemon.train.entity.Orders;

import java.util.Date;

public interface OrderService {
    ResponseResult submitOrder(Orders orders);

    ResponseResult queryOrders(Integer orderId);

    ResponseResult getDetailOrder(Integer id);

    ResponseResult deleteOrder(Orderinfo orderinfo);

    ResponseResult delOrder(Integer id);

    ResponseResult changeTicket(int trainid, Date date, int orderid);
}

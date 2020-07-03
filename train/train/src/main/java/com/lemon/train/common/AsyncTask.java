package com.lemon.train.common;

import com.lemon.train.mapper.OrdersMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

@Component
@Async
public class AsyncTask {

    @Autowired
    OrdersMapper ordersMapper;

    /**
     * 用户登录时判断
     * @param id
     */
    public void updateOrderState(Integer id){
        ordersMapper.updateOrderState(id);
    }
}

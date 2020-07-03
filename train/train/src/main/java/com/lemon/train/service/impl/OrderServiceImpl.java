package com.lemon.train.service.impl;


import com.lemon.train.common.ResponseResult;
import com.lemon.train.entity.*;
import com.lemon.train.mapper.*;
import com.lemon.train.service.OrderService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {


    @Autowired
    OrdersMapper ordersMapper;
    @Autowired
    OrderinfoMapper orderinfoMapper;

    @Autowired
    TrainseatMapper trainseatMapper;
    @Autowired
    OrderseatMapper orderseatMapper;
    @Autowired
    UserMapper userMapper;
    @Autowired
    SeatinfoMapper seatinfoMapper;

    @Override
    @Transactional
    public ResponseResult submitOrder(Orders orders) {

        //检查用户是否审核通过
        User user = userMapper.selectByPrimaryKey(orders.getUserId());
        if(user.getStatus()!=1){
            return new ResponseResult(303,"fail",null);
        }

        orders.setStatus(2);
        Date date = new Date();
        orders.setCreatetime(date);


        int i = ordersMapper.decreaseTrainNum(orders.getTrainId(),orders.getTraindate(), orders.getSeattype());
        if(i==0){
            return new ResponseResult(501,"票已卖完",null);
        }
        //占座返回座位表
        Orderseat orderseat = orderseatMapper.selectSeatPrimaryKey(orders.getTraindate(),orders.getTrainId(),orders.getSeattype());
        orderseat.setStatus(1);
        orderseatMapper.updateByPrimaryKeySelective(orderseat);

        //返回具体的座位号和车厢
        Trainseat trainseat = trainseatMapper.selectByPrimaryKey(orderseat.getSeatId());
        orders.setCarriage(trainseat.getCarriage());
        orders.setSeat(trainseat.getSeat());
        int result = ordersMapper.insert(orders);
        return new ResponseResult(200,"suc",null);
    }

    @Override
    public ResponseResult queryOrders(Integer orderId) {
        OrderinfoExample example = new OrderinfoExample();
        OrderinfoExample.Criteria criteria = example.createCriteria();
        criteria.andOrderIdEqualTo(orderId);
        example.setOrderByClause("traindate DESC");
        List<Orderinfo> orderinfos = orderinfoMapper.selectByExample(example);
        return new ResponseResult(200,"success",orderinfos);
    }

    @Override
    public ResponseResult getDetailOrder(Integer id) {
        Orderinfo orderinfo = orderinfoMapper.selectDetailOrder(id);
        if(orderinfo!=null){
            return new ResponseResult(200,"success",orderinfo);
        }
        return new ResponseResult(400,"没有找到",null);
    }


    /**
     *通过座位号和车厢获取当前预订座位号id,方便把座位让出来
     */
    private int getOrderSeatId(Orderinfo orders){
        Seatinfo seatinfo = new Seatinfo(orders.getTrainid(),orders.getCarriage(),orders.getSeattype(),orders.getSeat(),orders.getTraindate());
        int orderseatid = seatinfoMapper.selectBySelective(seatinfo);
        return orderseatid;
    }

    /**
     * 删除订单
     * @param id
     * @return
     */
    @Override
    public ResponseResult delOrder(Integer id) {
        ordersMapper.deleteByPrimaryKey(id);
        return new ResponseResult(200,"删除成功",null);
    }


    /**
     * 改签
     * @param trainid
     * @param date
     * @param orderid
     * @return
     */
    @Override
    @Transactional
    public ResponseResult changeTicket(int trainid, Date date, int orderid) {

        Orderinfo orderinfo = orderinfoMapper.selectDetailOrder(orderid);
        System.out.println(orderinfo);
        int i = ordersMapper.decreaseTrainNum(trainid,date,orderinfo.getSeattype());
        if(i==0){
            return new ResponseResult(501,"票已卖完",null);
        }

        Orders orders = new Orders();
        BeanUtils.copyProperties(orderinfo,orders);

        System.out.println(orders);
        // 占座返回座位表
        Orderseat orderseat = orderseatMapper.selectSeatPrimaryKey(date,trainid,orderinfo.getSeattype());
        System.out.println(orderseat);
        orderseat.setStatus(1);
        orderseatMapper.updateByPrimaryKeySelective(orderseat);

        //设置成待出行状态
        orders.setStatus(5);
        orders.setTraindate(date);
        orders.setTrainId(trainid);
        orders.setUserId(userMapper.selectUserByOtherCondition(orderinfo.getIdcard()).getId());

        //返回具体的座位号和车厢
        Trainseat trainseat = trainseatMapper.selectByPrimaryKey(orderseat.getSeatId());
        orders.setCarriage(trainseat.getCarriage());
        orders.setSeat(trainseat.getSeat());
        int result = ordersMapper.updateByPrimaryKeySelective(orders);


        //最后退掉之前的座位号
        int orderseatid = getOrderSeatId(orderinfo);
        //把座位空出来
        Orderseat returnorderseat = new Orderseat();
        returnorderseat.setStatus(0);
        returnorderseat.setId(orderseatid);
        orderseatMapper.updateByPrimaryKeySelective(orderseat);

        //增加余票数量
        ordersMapper.increaseTrainNum(orderinfo.getTrainid(),orderinfo.getTraindate(),orderinfo.getSeattype());

        return new ResponseResult(200,"成功",null);
    }


    /**
     * 退票
     * @param orders
     * @return
     */
    @Override
    @Transactional
    public ResponseResult deleteOrder(Orderinfo orders) {
        System.out.println(orders);
        int orderseatid = getOrderSeatId(orders);
        //把座位空出来
        Orderseat orderseat = new Orderseat();
        orderseat.setStatus(0);
        orderseat.setId(orderseatid);
        orderseatMapper.updateByPrimaryKeySelective(orderseat);

        //增加余票数量
        ordersMapper.increaseTrainNum(orders.getTrainid(),orders.getTraindate(),orders.getSeattype());

        //最后状态4表示订单已退
        Orders orders1 = new Orders();
        orders1.setId(orders.getId());
        orders1.setStatus(4);
        ordersMapper.updateByPrimaryKeySelective(orders1);
        return new ResponseResult(200,"成功",null);
    }


}

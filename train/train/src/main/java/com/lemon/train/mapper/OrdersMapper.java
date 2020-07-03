package com.lemon.train.mapper;

import com.lemon.train.entity.Orders;
import com.lemon.train.entity.OrdersExample;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface OrdersMapper {
    long countByExample(OrdersExample example);

    int deleteByExample(OrdersExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Orders record);

    int insertSelective(Orders record);

    List<Orders> selectByExample(OrdersExample example);

    Orders selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Orders record, @Param("example") OrdersExample example);

    int updateByExample(@Param("record") Orders record, @Param("example") OrdersExample example);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);


    /**
     * 修改火车的票数，后期可以集成到redis
     */
    int decreaseTrainNum(Integer trainId, Date traindate,Integer type);

    int increaseTrainNum(Integer trainId, Date traindate,Integer type);

    int updateOrderState(Integer id);
}
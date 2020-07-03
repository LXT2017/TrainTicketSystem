package com.lemon.train.mapper;


import com.lemon.train.entity.Orderseat;
import com.lemon.train.entity.OrderseatExample;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface OrderseatMapper {
    long countByExample(OrderseatExample example);

    int deleteByExample(OrderseatExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Orderseat record);

    int insertSelective(Orderseat record);

    List<Orderseat> selectByExample(OrderseatExample example);

    Orderseat selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Orderseat record, @Param("example") OrderseatExample example);

    int updateByExample(@Param("record") Orderseat record, @Param("example") OrderseatExample example);

    int updateByPrimaryKeySelective(Orderseat record);

    int updateByPrimaryKey(Orderseat record);

    /**
     * 返回座位主键
     */
    Orderseat selectSeatPrimaryKey(Date orderdate, Integer trainid,Integer type);
}
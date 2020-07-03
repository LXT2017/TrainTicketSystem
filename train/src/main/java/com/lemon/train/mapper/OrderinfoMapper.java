package com.lemon.train.mapper;

import com.lemon.train.entity.Orderinfo;
import com.lemon.train.entity.OrderinfoExample;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface OrderinfoMapper {
    long countByExample(OrderinfoExample example);

    int deleteByExample(OrderinfoExample example);

    int insert(Orderinfo record);

    int insertSelective(Orderinfo record);

    List<Orderinfo> selectByExample(OrderinfoExample example);

    int updateByExampleSelective(@Param("record") Orderinfo record, @Param("example") OrderinfoExample example);

    int updateByExample(@Param("record") Orderinfo record, @Param("example") OrderinfoExample example);

    @Select("select * from orderinfo where id=#{id}")
    Orderinfo selectDetailOrder(Integer id);
}
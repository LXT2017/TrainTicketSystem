package com.lemon.train.mapper;

import com.lemon.train.entity.Holiday;
import com.lemon.train.entity.HolidayExample;
import com.lemon.train.entity.Pricemanage;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface HolidayMapper {
    long countByExample(HolidayExample example);

    int deleteByExample(HolidayExample example);

    int deleteByPrimaryKey(Date vacation);

    int insert(Holiday record);

    int insertSelective(Holiday record);

    List<Holiday> selectByExample(HolidayExample example);

    Holiday selectByPrimaryKey(Date vacation);

    int updateByExampleSelective(@Param("record") Holiday record, @Param("example") HolidayExample example);

    int updateByExample(@Param("record") Holiday record, @Param("example") HolidayExample example);

    int updateByPrimaryKeySelective(Holiday record);

    int updateByPrimaryKey(Holiday record);

    // 通过状态获得
    double getSpecialDiscount(Map map);

    //更新折扣表
    int updateDiscountById(Pricemanage priceManage);

    @Select("select * from pricemanage where id=1 limit 1")
    Pricemanage getDiscount();

    //获得当天交易额
    void getToalPrice(Map map);
}
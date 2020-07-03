package com.lemon.train.mapper;

import com.lemon.train.entity.Trainticket;
import com.lemon.train.entity.TrainticketExample;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface TrainticketMapper {
    long countByExample(TrainticketExample example);

    int deleteByExample(TrainticketExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Trainticket record);

    int insertSelective(Trainticket record);

    List<Trainticket> selectByExample(TrainticketExample example);

    Trainticket selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Trainticket record, @Param("example") TrainticketExample example);

    int updateByExample(@Param("record") Trainticket record, @Param("example") TrainticketExample example);

    int updateByPrimaryKeySelective(Trainticket record);

    int updateByPrimaryKey(Trainticket record);

    int insertDepartTrain(@Param("id") Integer id, @Param("traindate") Date traindate);
}
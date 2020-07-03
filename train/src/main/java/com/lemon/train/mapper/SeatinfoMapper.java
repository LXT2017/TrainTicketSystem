package com.lemon.train.mapper;

import com.lemon.train.entity.Seatinfo;
import com.lemon.train.entity.SeatinfoExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SeatinfoMapper {
    long countByExample(SeatinfoExample example);

    int deleteByExample(SeatinfoExample example);

    int insert(Seatinfo record);

    int insertSelective(Seatinfo record);

    List<Seatinfo> selectByExample(SeatinfoExample example);

    int updateByExampleSelective(@Param("record") Seatinfo record, @Param("example") SeatinfoExample example);

    int updateByExample(@Param("record") Seatinfo record, @Param("example") SeatinfoExample example);

    int selectBySelective(Seatinfo seatinfo);
}
package com.lemon.train.mapper;

import com.lemon.train.entity.Traininfos;
import com.lemon.train.entity.TraininfosExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TraininfosMapper {
    long countByExample(TraininfosExample example);

    int deleteByExample(TraininfosExample example);

    int insert(Traininfos record);

    int insertSelective(Traininfos record);

    List<Traininfos> selectByExample(TraininfosExample example);

    int updateByExampleSelective(@Param("record") Traininfos record, @Param("example") TraininfosExample example);

    int updateByExample(@Param("record") Traininfos record, @Param("example") TraininfosExample example);
}
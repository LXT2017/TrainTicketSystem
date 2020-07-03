package com.lemon.train.mapper;

import com.lemon.train.entity.Trainseat;
import com.lemon.train.entity.TrainseatExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TrainseatMapper {
    long countByExample(TrainseatExample example);

    int deleteByExample(TrainseatExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Trainseat record);

    int insertSelective(Trainseat record);

    List<Trainseat> selectByExample(TrainseatExample example);

    Trainseat selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Trainseat record, @Param("example") TrainseatExample example);

    int updateByExample(@Param("record") Trainseat record, @Param("example") TrainseatExample example);

    int updateByPrimaryKeySelective(Trainseat record);

    int updateByPrimaryKey(Trainseat record);

}
package com.lemon.train.mapper;

import com.lemon.train.entity.Trainstate;
import com.lemon.train.entity.TrainstateExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TrainstateMapper {
    long countByExample(TrainstateExample example);

    int deleteByExample(TrainstateExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Trainstate record);

    int insertSelective(Trainstate record);

    List<Trainstate> selectByExample(TrainstateExample example);

    Trainstate selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Trainstate record, @Param("example") TrainstateExample example);

    int updateByExample(@Param("record") Trainstate record, @Param("example") TrainstateExample example);

    int updateByPrimaryKeySelective(Trainstate record);

    int updateByPrimaryKey(Trainstate record);


}
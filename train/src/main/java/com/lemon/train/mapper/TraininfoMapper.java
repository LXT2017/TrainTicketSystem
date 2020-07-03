package com.lemon.train.mapper;

import com.lemon.train.entity.Traininfo;
import com.lemon.train.entity.TraininfoExample;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface TraininfoMapper {
    long countByExample(TraininfoExample example);

    int deleteByExample(TraininfoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Traininfo record);

    int insertSelective(Traininfo record);

    List<Traininfo> selectByExample(TraininfoExample example);

    Traininfo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Traininfo record, @Param("example") TraininfoExample example);

    int updateByExample(@Param("record") Traininfo record, @Param("example") TraininfoExample example);

    int updateByPrimaryKeySelective(Traininfo record);

    int updateByPrimaryKey(Traininfo record);

    List<Map> selectTrainInfo();


    @Select("select fnum,snum from traininfo where train_id=#{id}")
    Traininfo selectSingleTrainInfo(Integer id);

    List<Traininfo> selectTrainInfoByIdlist(List<Integer> idlist);
}
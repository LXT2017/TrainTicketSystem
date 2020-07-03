package com.lemon.train.mapper;

import com.lemon.train.entity.Passenger;
import com.lemon.train.entity.User;
import com.lemon.train.entity.UserExample;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserMapper {
    long countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);



    @Select("select * from user where username=#{username}")
    User queryByUsername(String username);

    @Select("select user_id,name,type,idcard from passenger where userrelation_id=#{userid}")
    @Results({
            @Result(property = "id",column = "user_id")
    })
    List<Passenger> queryPassenger(String userid);


    @Select("select * from user where status=#{condition}")
    List<User> selectByCondition(String condition);

    @Select("select * from user where status<>#{condition}")
    List<User> selectByCondition1(String condition);

    @Select("select * from user where idcard=#{idcard} limit 1")
    User selectUserByOtherCondition(String idcard);
    /**
     * 管理员登录
     * @param username
     * @return
     */
    @Select("select password from admin where username=#{username} limit 1")
    String selectAdminPassword(String username);
}
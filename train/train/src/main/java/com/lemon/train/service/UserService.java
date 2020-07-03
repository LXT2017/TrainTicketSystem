package com.lemon.train.service;

import com.lemon.train.common.ResponseResult;
import com.lemon.train.entity.User;

public interface UserService {

    ResponseResult userLogin(String username, String password);

    ResponseResult userRegister(User user);

    ResponseResult queryPassenger(String id);

    ResponseResult queryAllUser(Integer pagenum,String condition, Integer pagesize);

    ResponseResult putUser(User user);

    ResponseResult vagueUsers(String realname);

    ResponseResult adminLogin(String username, String password);
}

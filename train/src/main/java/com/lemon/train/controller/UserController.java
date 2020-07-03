package com.lemon.train.controller;


import com.lemon.train.common.ResponseResult;
import com.lemon.train.entity.User;
import com.lemon.train.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.*;

@RequestMapping("user")
@RestController
public class UserController {

    @Qualifier("user")
    @Autowired
    UserService userService;

    @PostMapping("/login")
    public ResponseResult userLogin(String username, String password){
        return userService.userLogin(username,password);
    }

    @PostMapping("/register")
    public ResponseResult userRegister(@RequestBody User user){
        return userService.userRegister(user);
    }

    @GetMapping("/querypassenger")
    public ResponseResult queryPassenger(String id){
        return userService.queryPassenger(id);
    }


    /**
     * 管理员登录
     */
    @PostMapping("/adminlogin")
    public ResponseResult adminLogin(String username,String password){
        return userService.adminLogin(username,password);
    }

    /**
     * 管理员端
     * 根据条件查询
     */
    @GetMapping("/queryalluser")
    public ResponseResult queryAllUser(Integer pagenum,String condition, Integer pagesize){
        return userService.queryAllUser(pagenum,condition,pagesize);
    }

    /**
     * 用户的表更新
     */
    @PutMapping("/putuser")
    public ResponseResult putUser(@RequestBody User user){
        return userService.putUser(user);
    }

    /**
     * 根据真实姓名模糊查询
     */
    @GetMapping("/vagueusers")
    public ResponseResult vagueUsers(String realname){
        return userService.vagueUsers(realname);
    }
}

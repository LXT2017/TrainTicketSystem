package com.lemon.train.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lemon.train.common.AsyncTask;
import com.lemon.train.common.ResponseResult;
import com.lemon.train.entity.Passenger;
import com.lemon.train.entity.User;
import com.lemon.train.entity.UserExample;
import com.lemon.train.mapper.UserMapper;
import com.lemon.train.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


@Service("user")
public class UserServiceImpl implements UserService {

    @Autowired
    AsyncTask asyncTask;

    @Autowired
    UserMapper userMapper;

    @Override
    public ResponseResult userLogin(String username, String password) {
        User user = userMapper.queryByUsername(username);

        if (user != null && user.getPassword().equals(password)) {
            user.setPassword("");
            asyncTask.updateOrderState(user.getId());
            return new ResponseResult(200,"登陆成功",user);
        }
        return new ResponseResult(301,"账户或密码错误",null);
    }

    /**
     * 注册
     * @param user
     * @return
     */
    @Override
    public ResponseResult userRegister(User user) {
        if(userMapper.queryByUsername(user.getUsername())!=null){
            return new ResponseResult(302,"用户名已被注册",null);
        }
        user.setStatus(0);
        user.setCreatedate(new Date());
        userMapper.insert(user);
        return new ResponseResult(200,"注册成功",null);
    }

    //查询乘车人
    @Override
    public ResponseResult queryPassenger(String id) {
        List<Passenger> passengerlist = userMapper.queryPassenger(id);
        return new ResponseResult(200,"成功",passengerlist);
    }







    /**
     * 管理员
     * @return
     */
    @Override
    public ResponseResult queryAllUser(Integer pagenum,String condition, Integer pagesize) {
        List<User> users= null;
        PageHelper.startPage(pagenum,pagesize);
        if("0".equals(condition)) {
             users = userMapper.selectByExample(null);
        }else if("1".equals(condition)){
            users = userMapper.selectByCondition("0");
        }else{
            users = userMapper.selectByCondition1("0");
        }
        PageInfo<User> pages = new PageInfo<>(users);
        return new ResponseResult(200,"sucess", pages);
    }

    @Override
    public ResponseResult putUser(User user) {
        userMapper.updateByPrimaryKeySelective(user);
        return new ResponseResult(200,"sucess", null);
    }

    @Override
    public ResponseResult vagueUsers(String realname) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andRealnameLike("%"+realname+"%");
        List<User> users = userMapper.selectByExample(example);
        return new ResponseResult(200,"sucess",users);
    }

    @Override
    public ResponseResult adminLogin(String username, String password) {
        String password1 = userMapper.selectAdminPassword(username);
        if(password.equals(password1)){
            return new ResponseResult(200,"success",200);

        }
        return new ResponseResult(400,"fail",400);
    }

}

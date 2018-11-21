package com.service.api.impl;

import com.bean.User;
import com.dao.UserMapper;
import com.dto.bo.UserBo;
import com.service.api.UserInfoApi;
import com.util.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

/**
 * Created by FWS on 2018/4/25.
 */
@Service
public class UserInfoApiImpl implements UserInfoApi {

    @Autowired
    private RedisUtils redisUtils;
    @Autowired
    UserMapper userMapper;
    public UserBo getUserBo(HttpSession session) {
        //获取当前账户Email
        String email= (String) session.getAttribute("email");
        //  从redis 里面获取用户信息
        User user = (User) redisUtils.get(email);
        if(user==null){
            return null;
        }

        UserBo userBo=new UserBo();
        userBo.setId(user.getUid());
        userBo.setUsername(user.getUsername());
        userBo.setEmail(user.getUemail());
        userBo.setPhone(user.getUphone());
        userBo.setRealName(user.getUname());
        userBo.setAge(user.getUage());
        userBo.setSex(user.getUsex());
        userBo.setRegistTime(user.getUregistertime());

        return userBo;
    }

    public UserBo getUserBoByUserId(String userId) {

        User user = userMapper.selectByPrimaryKey(userId);

        if (user!=null){
            UserBo userBo=new UserBo();
            userBo.setId(user.getUid());
            userBo.setUsername(user.getUsername());
            userBo.setEmail(user.getUemail());
            userBo.setPhone(user.getUphone());
            return userBo;
        }
       return null;
    }

    public User getUserByUserId(String userId) {
        return userMapper.selectByPrimaryKey(userId);
    }
}

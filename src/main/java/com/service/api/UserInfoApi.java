package com.service.api;

import com.bean.User;
import com.dto.bo.UserBo;

import javax.servlet.http.HttpSession;

/**
 * Created by FWS on 2018/4/25.
 */
public interface UserInfoApi {

    /**
     * 获取当前用户信息
     * @param session
     * @return
     */
     UserBo getUserBo(HttpSession session);

    /**
     * 通过userId 获取用户BO信息
     * @param userId
     * @return
     */
     UserBo getUserBoByUserId(String  userId);

    /**
     * 通过userId 获取用户信息
     * @param userId
     * @return
     */
    User getUserByUserId(String  userId);


}

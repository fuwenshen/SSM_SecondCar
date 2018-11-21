package com.service.menber;

import com.bean.User;
import com.dto.bo.OrderCountBo;
import com.dto.param.UpdatePasswordParam;
import com.dto.param.UserParam;
import com.util.ServiceException;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by FWS on 2018/3/19.
 */
public interface MemberService {


    /**
     * check 用户
     * @param param
     * @return
     */
    User  checkLogin(UserParam param);




    /**
     * 激活账户并且登陆
     * @param request
     */
    User processActivate(HttpServletRequest request) throws ServiceException;

    /**
     *  用户注册并发送邮箱验证
     * @param param
     * @return
     */
    int processRegister(UserParam param) throws ServiceException;

    /**
     * 更新用户数据
     * @param param
     * @return
     */
    int updateUserInfo(UserParam param);

    /**
     * 更改用户密码
     * @param param
     * @return
     */
    int updatePassword(UpdatePasswordParam param);

    /**
     * 获取订单数量/收藏数量
     * @param userId
     * @return
     */
    OrderCountBo getOrderCount(String userId);
}

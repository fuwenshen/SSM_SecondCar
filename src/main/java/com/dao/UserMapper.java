package com.dao;

import com.bean.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
    int deleteByPrimaryKey(String uid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String uid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    /**
     * 通过username 获取
     * @param username
     * @return
     */
    User selectByUsername(String username);

    /**
     * 通过邮箱获取
     * @param uemail
     * @return
     */
    User selectByUemail(String uemail);

    /**
     * 通过电话获取
     * @param phone
     * @return
     */
    User selectByPhone(String phone);
}
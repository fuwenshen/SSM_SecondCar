package com.dto.bo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * Created by FWS on 2018/4/24.
 */
@Setter
@Getter
public class UserBo {
    private String id;
    private String username;
    private String email;
    private String phone;
    private String realName;
    private Integer age;
    private String sex;
    private Date registTime;

}

package com.dto.param;

import lombok.Data;

import java.util.Date;

@Data
public class UserParam {
    private String id;

    private String username;

    private String password;

    private String name;

    private Integer age;

    private String sex;

    private String email;

    private String phone;

    private Date registertime;

    private Byte status;

    private String validatecode;

    private Boolean check;


}
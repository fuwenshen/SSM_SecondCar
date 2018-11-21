package com.dto.bo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Setter
@Getter
public class CarInfoBo implements Serializable{

    // 图片地址
    private String pic_url;

    // 汽车信息
    private String carId;

    private String brand;

    private String carName;

    private String confName;

    private String level;

    private String engine;

    private String gearbox;

    private String bodyStructure;

    private String size;

    private String maximumspeed;

    private String cargoVolume;

    private Double carAge;

    private Double carMileage;

    private String carDamage;

    private String iseager;

    private Double price;

    private String licenseAddress;

    private String address;

    private String islocked;

    private String uid;

    private String  phone;
}
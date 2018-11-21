package com.dto.param;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.util.List;

public class CarInfoParams {

    // 图片文件
    private List<CommonsMultipartFile> carPic;

    // 汽车信息

    private String brand;

    private String carName;

    private String confName;

    private Double carAge;

    private Double carMileage;

    private String carDamage;

    private String iseager;

    private Double price;

    private String address;

    private String licenseAddress;

    public List<CommonsMultipartFile> getCarPic() {
        return carPic;
    }

    public void setCarPic(List<CommonsMultipartFile> carPic) {
        this.carPic = carPic;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }

    public String getConfName() {
        return confName;
    }

    public void setConfName(String confName) {
        this.confName = confName;
    }

    public Double getCarAge() {
        return carAge;
    }

    public void setCarAge(Double carAge) {
        this.carAge = carAge;
    }

    public Double getCarMileage() {
        return carMileage;
    }

    public void setCarMileage(Double carMileage) {
        this.carMileage = carMileage;
    }

    public String getCarDamage() {
        return carDamage;
    }

    public void setCarDamage(String carDamage) {
        this.carDamage = carDamage;
    }

    public String getIseager() {
        return iseager;
    }

    public void setIseager(String iseager) {
        this.iseager = iseager;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLicenseAddress() {
        return licenseAddress;
    }

    public void setLicenseAddress(String licenseAddress) {
        this.licenseAddress = licenseAddress;
    }
}
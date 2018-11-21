package com.dto.param;

/**
 * Created by FWS on 2018/4/3.
 */
public class CarParam {
    //汽车id
    private String carId;

    //品牌
    private String brand;

    private String level;
    // 车名
    private String carName;

    // 车龄
    private Double carAge1;
    private Double carAge2;

    //行驶里程区间
    private Double carMileage1;
    private Double carMileage2;

    //  价格区间
    private Double fPrice;
    private Double ePrice;

    public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId;
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

    public Double getCarAge1() {
        return carAge1;
    }

    public void setCarAge1(Double carAge1) {
        this.carAge1 = carAge1;
    }

    public Double getCarAge2() {
        return carAge2;
    }

    public void setCarAge2(Double carAge2) {
        this.carAge2 = carAge2;
    }

    public Double getCarMileage1() {
        return carMileage1;
    }

    public void setCarMileage1(Double carMileage1) {
        this.carMileage1 = carMileage1;
    }

    public Double getCarMileage2() {
        return carMileage2;
    }

    public void setCarMileage2(Double carMileage2) {
        this.carMileage2 = carMileage2;
    }

    public Double getfPrice() {
        return fPrice;
    }

    public void setfPrice(Double fPrice) {
        this.fPrice = fPrice;
    }

    public Double getePrice() {
        return ePrice;
    }

    public void setePrice(Double ePrice) {
        this.ePrice = ePrice;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }
}

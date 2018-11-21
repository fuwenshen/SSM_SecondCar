package com.dao;


import com.bean.CarSafetyInfo;
import org.springframework.stereotype.Repository;

@Repository
public interface CarSafetyInfoMapper {
    int deleteByPrimaryKey(String carId);

    int insert(CarSafetyInfo record);

    int insertSelective(CarSafetyInfo record);

    CarSafetyInfo selectByPrimaryKey(String carId);

    int updateByPrimaryKeySelective(CarSafetyInfo record);

    int updateByPrimaryKey(CarSafetyInfo record);
}
package com.dao;


import com.bean.CarEngineInfo;
import org.springframework.stereotype.Repository;

@Repository
public interface CarEngineInfoMapper {
    int deleteByPrimaryKey(String carId);

    int insert(CarEngineInfo record);

    int insertSelective(CarEngineInfo record);

    CarEngineInfo selectByPrimaryKey(String carId);

    int updateByPrimaryKeySelective(CarEngineInfo record);

    int updateByPrimaryKey(CarEngineInfo record);
}
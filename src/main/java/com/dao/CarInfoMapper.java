package com.dao;


import com.bean.CarInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CarInfoMapper {
    int deleteByPrimaryKey(String carId);

    int insert(CarInfo record);

    int insertSelective(CarInfo record);

    CarInfo selectByPrimaryKey(String carId);

    int updateByPrimaryKeySelective(CarInfo record);

    int updateByPrimaryKey(CarInfo record);

    List<CarInfo> selectCarInfoAll();

    List<CarInfo> selectByUid(String uid);

    /**
     * 通过关键字查询
     * @param keyword
     * @return
     */
    List<CarInfo> selectCarInfoByKeyword(@Param("keyword") String keyword);

    /**
     * 通过条件查询车列表
     * @param brand
     * @param price1
     * @param price2
     * @param carAge1
     * @param carAge2
     * @param level
     * @param carMileage1
     * @param carMileage2
     * @param carName
     * @return
     */
    List<CarInfo> selectCarInfoByCondition(@Param("brand") String brand, @Param("price1") Double price1,@Param("price2") Double price2,@Param("carAge1") Double carAge1, @Param("carAge2")Double carAge2,
                                           @Param("level") String level, @Param("carMileage1") Double carMileage1,@Param("carMileage2") Double carMileage2, @Param("carName") String carName);

    /**
     * 获取所有可出售的车
     * @return
     */
    List<CarInfo> selectAllEnableCarInfo();
}
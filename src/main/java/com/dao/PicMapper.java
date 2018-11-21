package com.dao;


import com.bean.Pic;
import com.bean.PicKey;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface PicMapper {
    int deleteByPrimaryKey(PicKey key);

    int insert(Pic record);

    int insertSelective(Pic record);

    Pic selectByPrimaryKey(PicKey key);

    int updateByPrimaryKeySelective(Pic record);

    int updateByPrimaryKey(Pic record);

    List<Pic> selectByCarId(String carId);
}
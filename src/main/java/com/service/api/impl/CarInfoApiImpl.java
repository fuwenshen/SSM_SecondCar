package com.service.api.impl;

import com.bean.CarInfo;
import com.bean.Pic;
import com.dao.CarInfoMapper;
import com.dao.PicMapper;
import com.dto.bo.CarInfoBo;
import com.service.api.CarInfoApi;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by FWS on 2018/4/25.
 */
@Service
public class CarInfoApiImpl implements CarInfoApi {

    @Autowired
    private PicMapper picMapper;
    @Autowired
    private CarInfoMapper carInfoMapper;


    public CarInfoBo getCarInfoBoByUserId(String userId) {


        CarInfoBo carInfoBo =new CarInfoBo();


        return carInfoBo;

    }

    public CarInfoBo getCarInfoBoByCarId(String carId) {
        CarInfo carInfo =carInfoMapper.selectByPrimaryKey(carId);
        CarInfoBo carInfoBo =new CarInfoBo();
        BeanUtils.copyProperties(carInfo,carInfoBo);
        // 封装图片url和carInfo
        List<Pic> pics = picMapper.selectByCarId(carInfo.getCarId());
        // 使用第一张图片
        carInfoBo.setPic_url(pics.get(0).getPicUrl());

        return carInfoBo;
    }

    public List<CarInfoBo> getAllEnableCarInfoBo() {
        List<CarInfoBo> carInfoBos=new ArrayList<CarInfoBo>();
        //获取所有可出售
        List<CarInfo> carInfoList =carInfoMapper.selectAllEnableCarInfo();
        for (CarInfo carInfo:carInfoList ) {
            CarInfoBo carInfoBo =new CarInfoBo();
            BeanUtils.copyProperties(carInfo,carInfoBo);
            // 封装图片url和carInfo
            List<Pic> pics = picMapper.selectByCarId(carInfo.getCarId());
            // 使用第一张图片
            carInfoBo.setPic_url(pics.get(0).getPicUrl());

            carInfoBos.add(carInfoBo);
        }
        return carInfoBos;
    }
}

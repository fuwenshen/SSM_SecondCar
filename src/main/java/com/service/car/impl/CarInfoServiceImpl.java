package com.service.car.impl;

import com.bean.*;
import com.dao.*;
import com.dto.bo.CarInfoBo;
import com.dto.bo.CarInfoDetailBo;
import com.dto.param.PageParam;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.car.CarInfoService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by FWS on 2018/3/28.
 */
@Service
public class CarInfoServiceImpl  implements CarInfoService{

    @Autowired
    CarInfoMapper carInfoMapper;
    @Autowired
    PicMapper picMapper;
    @Autowired
    OrderMapper orderMapper;
    @Autowired
    FavMapper   fdavMapper;
    @Autowired
    UserMapper userMapper;
    @Autowired
    CarInfoService carInfoService;
    @Autowired
    CarEngineInfoMapper carEngineInfoMapper;
    @Autowired
    CarChassisBrakeInfoMapper carChassisBrakeInfoMapper;
    @Autowired
    CarExternalInfoMapper carExternalInfoMapper;
    @Autowired
    CarInternalInfoMapper carInternalInfoMapper;
    @Autowired
    CarSafetyInfoMapper carSafetyInfoMapper;
    @Autowired
    HistoryMapper historyMapper;



    public PageInfo<CarInfoBo> selectCarInfoList(String keyword) {
        List<CarInfo> carInfoList;

        List<CarInfoBo> carInfoBos = new ArrayList();
        if(keyword!=null &&!"".equals(keyword)) {
            PageHelper.startPage(1,10);
            carInfoList =  carInfoMapper.selectCarInfoByKeyword(keyword);
        }else {
            // 获取所有可以出售的汽车信息
            PageHelper.startPage(1,10);
            carInfoList =  carInfoMapper.selectAllEnableCarInfo();
        }
        //分页数据
        PageInfo<CarInfo>  page=new PageInfo<CarInfo>(carInfoList);
        //筛选 可出售 汽车信息

        for (CarInfo carInfo:carInfoList) {
            if(carInfo.getIslocked().equals("可出售")) {
                CarInfoBo bo = new CarInfoBo();
                BeanUtils.copyProperties(carInfo,bo);

                // 封装图片url和carInfo
                List<Pic> pics = picMapper.selectByCarId(carInfo.getCarId());
                // 使用第一张图片
                bo.setPic_url(pics.get(0).getPicUrl());
                carInfoBos.add(bo);
            }
        }
        PageInfo<CarInfoBo>  infoBoPage=new PageInfo<CarInfoBo>(carInfoBos);
        infoBoPage.setPageNum(page.getPageNum());
        infoBoPage.setTotal(page.getTotal());
        infoBoPage.setPages(page.getPages());
        return infoBoPage;
    }

    /**
     * 获取 汽车详情
     * @param carId
     * @return
     */
    public CarInfoDetailBo selectCarInfoDetail(String carId) {

        CarInfoDetailBo bo  =  new CarInfoDetailBo();
        // 获取 carInfo
        CarInfo carInfo = carInfoMapper.selectByPrimaryKey(carId);
        // 获取  pic_url 列表
        List<Pic> pics = picMapper.selectByCarId(carInfo.getCarId());
        // 引擎信息
        CarEngineInfo carEngineInfo = carEngineInfoMapper.selectByPrimaryKey(carId);
        //底盘及制动
        CarChassisBrakeInfo carChassisBrakeInfo=carChassisBrakeInfoMapper.selectByPrimaryKey(carId);
        // 安全配置
        CarSafetyInfo carSafetyInfo = carSafetyInfoMapper.selectByPrimaryKey(carId);
        // 外部配置
        CarExternalInfo carExternalInfo = carExternalInfoMapper.selectByPrimaryKey(carId);
        // 内部配置
        CarInternalInfo carInternalInfo = carInternalInfoMapper.selectByPrimaryKey(carId);

        bo.setCarInfo(carInfo);
        bo.setPics(pics);
        bo.setCarEngineInfo(carEngineInfo);
        bo.setCarInternalInfo(carInternalInfo);
        bo.setCarSafetyInfo(carSafetyInfo);
        bo.setCarExternalInfo(carExternalInfo);
        bo.setCarChassisBrakeInfo(carChassisBrakeInfo);

        return bo;
    }

    public PageInfo<CarInfoBo> selectCarInfoListByCondition(PageParam param) {
        List<CarInfoBo> carInfoBos = new ArrayList();
        //进行分页
        PageHelper.startPage(param.getPageNum(),param.getPageSize());
        // 根据条件获取所有可出售汽车信息
        List<CarInfo> carInfoList =  carInfoMapper.selectCarInfoByCondition(param.getBrand(),param.getfPrice(),param.getePrice(),param.getCarAge1(),param.getCarAge2()
                                                                ,param.getLevel(),param.getCarMileage1(),param.getCarMileage2(),param.getCarName());

        //分页数据
        PageInfo<CarInfo>  page=new PageInfo<CarInfo>(carInfoList);
        //汽车信息
        for (CarInfo carInfo:carInfoList) {
                CarInfoBo bo = new CarInfoBo();
                BeanUtils.copyProperties(carInfo,bo);
                // 封装图片url和carInfo
                List<Pic> pics = picMapper.selectByCarId(carInfo.getCarId());
                // 使用第一张图片
                bo.setPic_url(pics.get(0).getPicUrl());
                carInfoBos.add(bo);
        }


        PageInfo<CarInfoBo>  infoBoPage=new PageInfo<CarInfoBo>(carInfoBos);
        infoBoPage.setPageNum(page.getPageNum());
        infoBoPage.setTotal(page.getTotal());
        infoBoPage.setPages(page.getPages());
        return infoBoPage;
    }
}

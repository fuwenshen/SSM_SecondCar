package com.service.api;

import com.dto.bo.CarInfoBo;

import java.util.List;

/**
 * Created by FWS on 2018/4/25.
 */
public interface CarInfoApi {

    /**
     *   通过 userId 获取汽车Bo信息
     * @param userId
     * @return
     */
    CarInfoBo getCarInfoBoByUserId(String userId);

    /**
     *  通过 carId 获取CarInfoBo
     * @param carId
     * @return
     */
    CarInfoBo getCarInfoBoByCarId(String carId);

    /**
     * 获取所有可出售汽车
     * @return
     */
    List<CarInfoBo>getAllEnableCarInfoBo();
}

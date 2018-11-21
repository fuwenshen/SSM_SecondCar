package com.dto.bo;

import com.bean.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * Created by FWS on 2018/3/29.
 */

@Setter
@Getter
public class CarInfoDetailBo {

    // carInfo
    CarInfo carInfo ;
    //  pic_url 列表
    List<Pic> pics ;
    // 引擎信息
    CarEngineInfo carEngineInfo ;
    //底盘及制动
    CarChassisBrakeInfo carChassisBrakeInfo;
    // 安全配置
    CarSafetyInfo carSafetyInfo ;
    // 外部配置
    CarExternalInfo carExternalInfo;
    // 内部配置
    CarInternalInfo carInternalInfo;

}

package com.dto.bo;

import lombok.Data;

import java.util.List;

/**
 * Created by FWS on 2018/4/25.
 */
@Data
public class MyCarBo {

    /**
     * 拥有的车辆
     */
    List<CarInfoBo> own=null;
    /**
     * 收藏汽车信息
     */
    List<CarInfoBo> myfav;
}

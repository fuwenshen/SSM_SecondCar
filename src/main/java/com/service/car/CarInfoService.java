package com.service.car;

import com.dto.bo.CarInfoBo;
import com.dto.bo.CarInfoDetailBo;
import com.dto.param.PageParam;
import com.github.pagehelper.PageInfo;

/**
 * Created by FWS on 2018/3/28.
 */
public interface CarInfoService {
    /**
     * 获取 汽车信息列表(分页)
     * @return
     * @param keyword
     */
    PageInfo<CarInfoBo> selectCarInfoList(String keyword);

    /**
     * 获取汽列表信息
     * @param carId
     * @return
     */
    CarInfoDetailBo selectCarInfoDetail(String carId);

    /**
     *  通过条件获取汽车列表
     * @param param
     * @return
     */
    PageInfo<CarInfoBo> selectCarInfoListByCondition(PageParam param);
}

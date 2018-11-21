package com.service.car;

import com.dto.param.CarInfoParams;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by FWS on 2018/4/12.
 */
public interface CarOptionService {
    /**
     * 保存汽车信息
     * @param request
     * @param params
     */
    void saveCarInfo(HttpServletRequest request, CarInfoParams params);
}

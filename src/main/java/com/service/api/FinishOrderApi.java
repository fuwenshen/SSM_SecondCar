package com.service.api;

/**
 * Created by FWS on 2018/5/9.
 */
public interface FinishOrderApi {

    /**
     * 创建历史订单
     * @param buyerId
     * @param sellerId
     * @param carId
     * @return
     */
    int createHistoryOrder(String buyerId, String sellerId, String carId);
}

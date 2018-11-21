package com.service.order;

import com.dto.bo.CarInfoBo;
import com.dto.bo.HistoryBo;
import com.dto.bo.OrderBo;

import java.util.List;

/**
 * Created by FWS on 2018/4/2.
 */
public interface OrderService {
    /**
     * 获取 订单
     * @param userId
     * @return
     */
    List<OrderBo> getUnfinshOrder(String userId);
    /**
     * 获取 完成 订单
     * @param userId
     * @return
     */
    List<OrderBo> getFinshOrder(String userId);

    /**
     *  创建 订单
     * @param userId
     * @param id
     * @return
     */
    int createOrder(String userId, String id);

    /**
     * 获取历史订单（完成订单）
     * @param user_id
     * @return
     */
    List<HistoryBo> getHistory(String user_id);

    /**
     * 获得我的收藏车
     * @param userId
     * @return
     */
    List<CarInfoBo> getMyFavorite(String userId);

    /**
     * 完成订单
     * @param userId
     * @param carId
     * @return
     */
    int finishOrder(String userId, String carId);

    /**
     * 获取需要确认的订单
     * @param userId
     * @return
     */
    List<OrderBo> checkOrder(String userId);

    /**
     * 卖家确认订单
     * @param orderId
     * @return
     */
    int confirmOrder(String orderId);


    /**
     * 获取卖家历史订单（已完成）
     * @param userId
     * @return
     */
    List<HistoryBo> getSellHistory(String userId);

    /**
     * 获取发布的车辆
     * @param userId
     * @return
     */
    List<CarInfoBo> getSellingCars(String userId);

    /**
     * 撤销发布车辆
     * @param carId
     * @return
     */
    int cancelSell(String carId);

    /**
     * 取消订单
     * @param orderId
     * @return
     */
    int delOrder(String orderId);
}

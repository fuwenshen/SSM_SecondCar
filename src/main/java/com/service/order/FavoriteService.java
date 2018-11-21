package com.service.order;

/**
 * 收藏夹
 * Created by FWS on 2018/5/6.
 */
public interface FavoriteService {

    /**
     * 添加至收藏
     * @param userId
     * @param carId
     * @return
     */
    int addFavorite(String userId, String carId);

    /**
     * 取消收藏
     * @param userId
     * @param carId
     * @return
     */
    int cancelFavorite(String userId, String carId);
}

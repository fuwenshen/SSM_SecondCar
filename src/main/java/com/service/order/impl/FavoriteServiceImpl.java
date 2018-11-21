package com.service.order.impl;

import com.bean.FavKey;
import com.dao.CarInfoMapper;
import com.dao.FavMapper;
import com.service.order.FavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by FWS on 2018/5/6.
 */
@Service
public class FavoriteServiceImpl implements FavoriteService {

    @Autowired
    FavMapper favMapper;
    @Autowired
    CarInfoMapper carInfoMapper;

    /**
     * 添加收藏
     * @param userId
     * @param carId
     * @return
     */
    public int addFavorite(String userId, String carId) {
        List<FavKey> favKeys =  favMapper.selectByUid(userId);
        //若已有收藏 处理
        for (FavKey favKeyT:favKeys) {
            if(carId.equals(favKeyT.getCarId()))
                // 已经收藏，
                return 2;
        }
        FavKey favKey = new FavKey(userId,carId);
        favMapper.insert(favKey);
        return 1;
    }

    /**
     * 取消收藏
     * @param userId
     * @param carId
     * @return
     */
    public int cancelFavorite(String userId, String carId) {

        FavKey favKey = new FavKey(userId,carId);
        // 删除
        favMapper.deleteByPrimaryKey(favKey);
        return 1;
    }
}

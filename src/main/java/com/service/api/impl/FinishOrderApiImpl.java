package com.service.api.impl;

import com.bean.History;
import com.dao.HistoryMapper;
import com.service.api.FinishOrderApi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by FWS on 2018/5/9.
 */
@Service
public class FinishOrderApiImpl implements FinishOrderApi {

    @Autowired
    HistoryMapper historyMapper;
    public int createHistoryOrder(String buyerId, String sellerId, String carId) {

        History history=new History();
        history.setBuyerId(buyerId);
        history.setCarId(carId);
        history.setSellerId(sellerId);
        // 新增数据
        int result=historyMapper.insertSelective(history);
        return result;
    }
}

package com.dto.bo;

import com.bean.Order;
import lombok.Getter;
import lombok.Setter;

/**
 * Created by FWS on 2018/4/2.
 */
@Setter
@Getter
public class OrderBo {
    private String phone;
    private Order order;
    private CarInfoBo carInfo;

}

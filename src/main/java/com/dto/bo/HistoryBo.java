package com.dto.bo;

import com.bean.CarInfo;
import com.bean.User;
import lombok.Getter;
import lombok.Setter;

/**
 * Created by FWS on 2018/4/2.
 */
@Setter
@Getter
public class HistoryBo {
    private User user;
    private CarInfo carInfo;

}

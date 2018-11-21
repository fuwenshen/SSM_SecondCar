package com.dto.param;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by FWS on 2018/4/16.
 */
@Setter
@Getter
public class PageParam extends CarParam {
    private int pageNum=1;
    private int pageSize=10;
}

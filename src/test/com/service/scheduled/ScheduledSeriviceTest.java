package com.service.scheduled;

import com.dto.bo.CarInfoBo;
import com.service.api.CarInfoApi;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by Administrator on 2018/11/10 0010.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml","classpath:spring-mvc.xml"})
@Slf4j
public class ScheduledSeriviceTest {

    @Autowired
    private ScheduledSerivice scheduledSerivice;
    @Autowired
    CarInfoApi carInfoApi;
    @Test
    public void recommend() throws Exception {

//        // 所有能售卖的汽车信息
//        List<CarInfoBo> allEnableCarInfoBo = carInfoApi.getAllEnableCarInfoBo();
//        log.debug(allEnableCarInfoBo.toString());

        scheduledSerivice.recommend();
    }



}

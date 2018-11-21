package com.service.scheduled;

import com.dto.bo.CarInfoBo;
import com.service.api.CarInfoApi;
import com.util.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import javax.servlet.ServletException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * 任务调度
 * Created by FWS on 2018/5/10.
 */
@Service
public class ScheduledSerivice {
    
    @Autowired
    CarInfoApi carInfoApi;
    @Autowired
    RedisUtils redisUtils;

    @Scheduled(cron = "0/5 * * * * ?") //，每5秒执行1次
    public void start() throws ServletException {
        System.out.println("-----Task!");
    }

    /**
     * 每天推荐  每天 0:00:00 （0点）执行一次 cron = "0 0 0 1/1 * ? "
     */
    @Scheduled(cron = "0 0 0/1 * * ? ")//每小时
    public void  recommend(){

        // 所有能售卖的汽车信息
        List<CarInfoBo> allEnableCarInfoBo = carInfoApi.getAllEnableCarInfoBo();

        List<CarInfoBo> recommend=new ArrayList<CarInfoBo>();
        //  随机推荐
        for(int i=0;i<6;i++){
            Random random = new Random();
            int ran = random.nextInt(allEnableCarInfoBo.size());
            recommend.add(allEnableCarInfoBo.get(ran));
        }

        redisUtils.set("recommend",recommend);
    }
}

package com.controller.yscar;

import com.dto.param.CarInfoParams;
import com.service.car.CarOptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by FWS on 2018/4/10.
 */
@RestController
@RequestMapping("/ysCar")
public class OptionController {


    @Autowired
    private CarOptionService carOptionService;

    /**
     *  卖车/ 保存汽车信息
     * @param request
     * @param params
     * @return
     */
     @RequestMapping(value = "/saveCarInfo")
    public ModelAndView saveCarInfo(HttpServletRequest request, final CarInfoParams params){
         ModelAndView mv= new ModelAndView();



         carOptionService.saveCarInfo(request,params);


         mv.setViewName("member/menberVip");
         return mv;
     }
}

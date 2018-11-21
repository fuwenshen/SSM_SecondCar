package com.controller.order;

import com.base.BasicRespMessage;
import com.dto.bo.CarInfoBo;
import com.dto.bo.HistoryBo;
import com.dto.bo.OrderBo;
import com.dto.bo.UserBo;
import com.service.api.UserInfoApi;
import com.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 作为卖家
 * Created by FWS on 2018/5/8.
 */
@Controller
@RequestMapping("/ysCar/order")
public class SellerController {

    @Autowired
    UserInfoApi userInfoApi;
    @Autowired
    OrderService  orderService;

    /**
     * 作为卖方 (订单列表)
     * @return
     */
    @RequestMapping("/seller")
    public ModelAndView sellOrder(HttpSession session){


        ModelAndView mv= new ModelAndView();

        // 获取 用户信息
        UserBo userBo = userInfoApi.getUserBo(session);
        mv.addObject("userInfo",userBo);

        // 获取用户id
        String userId = userBo.getId();

        // 获取卖家订单历史
        List<HistoryBo> historyBos =orderService.getSellHistory(userId);
        // 获取订单需要确认的订单
        List<OrderBo> checkOrder=orderService.checkOrder(userId);
        //获取发布的车辆
        List<CarInfoBo> carInfoBos=orderService.getSellingCars(userId);



        // 已经出售的车辆信息
        mv.addObject("selledList",historyBos);
        // add 需要确认的订单
        mv.addObject("checkOrder",checkOrder);
        //add 预出售车辆
        mv.addObject("sellingList",carInfoBos);

        //
        mv.addObject("page",5);
        mv.setViewName("member/seller");
        return mv;

    }

    /**
     * 卖家确认订单
     * @param orderId
     * @return
     */
    @RequestMapping("/confirmOrder")
    @ResponseBody
    public  BasicRespMessage  confirmOrder( @RequestParam String orderId ){

        BasicRespMessage resp= new BasicRespMessage();
       int result= orderService.confirmOrder(orderId);

       return resp.autoFilled(result);
    }

    @RequestMapping("/cancelSell")
    @ResponseBody
    public BasicRespMessage cancelSell(String carId){
        BasicRespMessage resp= new BasicRespMessage();
        int result= orderService.cancelSell(carId);

        return resp.autoFilled(result);
    }

}

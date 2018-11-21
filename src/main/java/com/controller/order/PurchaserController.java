package com.controller.order;

import com.base.BasicRespMessage;
import com.dto.bo.OrderBo;
import com.dto.bo.UserBo;
import com.service.api.UserInfoApi;
import com.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * 作为买家
 * Created by FWS on 2018/5/8.
 */

@RestController
@RequestMapping("/ysCar/order")
public class PurchaserController {
    @Autowired
    UserInfoApi userInfoApi;
    @Autowired
    OrderService orderService;

    /**
     * 作为买方
     * @return
     */
    @RequestMapping("/purchaser")
    public ModelAndView buyOrder(HttpSession session){
        ModelAndView mv= new ModelAndView();


        // 获取 用户信息
        UserBo userBo = userInfoApi.getUserBo(session);
        mv.addObject("userInfo",userBo);

        // 获取用户id
        String userId = userBo.getId();
        //获取 未完成 订单
        List<OrderBo> unfinshOrder=orderService.getUnfinshOrder(userId);
        // 获取已经完成订单
        List<OrderBo> finshOrder =orderService.getFinshOrder(userId);
        //  List<HistoryBo> historyBos =orderService.getHistory(userId);
        mv.addObject("unfinshOrder",unfinshOrder);
        mv.addObject("finshOrder",finshOrder);

        mv.setViewName("member/purchaser");
        mv.addObject("page",5);
        return mv;

    }


    /**
     * 取消订单（删除）
     * @param orderId
     * @return
     */
    @RequestMapping("/delOrder")
    @ResponseBody
    public BasicRespMessage delOrder(String orderId){
        BasicRespMessage resp= new BasicRespMessage();
        int result= orderService.delOrder(orderId);

        return resp.autoFilled(result);
    }


}

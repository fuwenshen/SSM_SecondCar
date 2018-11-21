package com.controller.order;

import com.base.BasicRespMessage;
import com.dto.bo.OrderBo;
import com.dto.bo.UserBo;
import com.dto.param.OrderParam;
import com.service.api.UserInfoApi;
import com.service.order.FavoriteService;
import com.service.order.OrderService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by FWS on 2018/3/26.
 */
@RestController
@RequestMapping("/ysCar/order")
public class OrderController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private FavoriteService favoriteService;
    @Autowired
    UserInfoApi userInfoApi;

    protected static Logger LOG=Logger.getLogger(OrderController.class);
    /**
     *点击预约 生成订单
     * @param session
     * @return
     */
    @RequestMapping("/createOrder")
    @ResponseBody
    public BasicRespMessage  create(HttpSession session, @RequestBody OrderParam param){
        BasicRespMessage resp =new BasicRespMessage();

        // 获取 用户信息
        UserBo userBo = userInfoApi.getUserBo(session);
        // 获取用户id
        String userId = userBo.getId();
        //创建订单
        int result= orderService.createOrder(userId,param.getCarId());

        if(result==2){
            return  resp.autoFilled(result,"该订单已经存在！");
        }
        if(result==1){
            LOG.debug("---------生产订单！-------");
            return  resp.autoFilled(1,"生成订单成功！");
        }
        return resp.autoFilled(0);


    }
    @RequestMapping("finishOrder")
    @ResponseBody
    public BasicRespMessage finishOrder(HttpSession session, @RequestBody OrderParam param){
        BasicRespMessage resp =new BasicRespMessage();
        // 获取 用户信息
        UserBo userBo = userInfoApi.getUserBo(session);
        // 获取用户id
        String userId = userBo.getId();
        //取消收藏
        int result= orderService.finishOrder(userId,param.getCarId());

        return resp.autoFilled(result);

    }


    /**
     * 获取订单
     * @param session
     * @return
     */
    @RequestMapping("/getOrder")
    public ModelAndView order(HttpSession session){
        ModelAndView mv=new ModelAndView();

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
        mv.addObject("page",5);
        mv.setViewName("member/order");
        return mv;
    }


}

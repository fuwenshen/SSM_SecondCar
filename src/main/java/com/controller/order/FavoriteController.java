package com.controller.order;

import com.base.BasicRespMessage;
import com.dto.bo.CarInfoBo;
import com.dto.bo.MyCarBo;
import com.dto.bo.UserBo;
import com.dto.param.OrderParam;
import com.service.api.UserInfoApi;
import com.service.order.FavoriteService;
import com.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * 收藏controller
 * Created by FWS on 2018/5/6.
 */

@Controller
@RequestMapping("/ysCar/order")
public class FavoriteController {

    @Autowired
    FavoriteService favoriteService;
    @Autowired
    OrderService  orderService;
    @Autowired
    UserInfoApi userInfoApi;

    /**
     *  add 收藏
     * @param session
     * @param param
     * @return
     */
    @RequestMapping("/createFav")
    @ResponseBody
    public BasicRespMessage createFav(HttpSession session, @RequestBody OrderParam param){
        BasicRespMessage resp =new BasicRespMessage();
        // 获取 用户信息
        UserBo userBo = userInfoApi.getUserBo(session);
        // 获取用户id
        String userId = userBo.getId();
        //创建订单
        int result= favoriteService.addFavorite(userId,param.getCarId());

        if(result==2){
            return  resp.autoFilled(result,"该汽车已被收藏！");
        }
        if(result==1){
            return  resp.autoFilled(1,"收藏成功！");
        }
        return resp.autoFilled(0);

    }



    /**
     *  cancel 收藏
     * @param session
     * @param param
     * @return
     */
    @RequestMapping("cancelFav")
    @ResponseBody
    public BasicRespMessage cancelFav(HttpSession session, @RequestBody OrderParam param){
        BasicRespMessage resp =new BasicRespMessage();
        // 获取 用户信息
        UserBo userBo = userInfoApi.getUserBo(session);
        // 获取用户id
        String userId = userBo.getId();
        //取消收藏
        int result= favoriteService.cancelFavorite(userId,param.getCarId());

        return resp.autoFilled(result);

    }

    /**
     * 获取我的收藏
     * @param session
     * @return
     */
    @RequestMapping("/myFavorite")
    public ModelAndView myFavorite(HttpSession session){
        ModelAndView mv=new ModelAndView();
        // 获取 用户信息
        UserBo userBo = userInfoApi.getUserBo(session);
        mv.addObject("userInfo",userBo);
        mv.addObject("page",5);
        //String user_id = "36331";
        // 获取用户id
        String userId = userBo.getId();


        MyCarBo myCarBo = new MyCarBo();
        List<CarInfoBo> myFavorite = orderService.getMyFavorite(userId);

        List<CarInfoBo> own =new ArrayList<CarInfoBo>();
        myCarBo.setMyfav(myFavorite);
        myCarBo.setOwn(own);
        mv.addObject("myCar",myCarBo);
        mv.setViewName("member/favorite");
        return mv;
    }
}

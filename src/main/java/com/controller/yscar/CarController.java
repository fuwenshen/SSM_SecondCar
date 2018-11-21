package com.controller.yscar;

import com.dto.bo.CarInfoBo;
import com.dto.bo.CarInfoDetailBo;
import com.dto.param.PageParam;
import com.github.pagehelper.PageInfo;
import com.service.car.CarInfoService;
import com.util.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by FWS on 2018/3/18.
 */
@RestController
@RequestMapping("/ysCar")
public class CarController {
    @Autowired
    private CarInfoService carInfoService;
    @Autowired
    RedisUtils redisUtils;


    @RequestMapping("/index")
    public ModelAndView index(){

        ModelAndView mv=new ModelAndView();
        //获取推荐 汽车信息
        List<CarInfoBo> recommend= (List<CarInfoBo>) redisUtils.get("recommend");
        mv.addObject("recommend",recommend);

        mv.setViewName("index");
        mv.addObject("page",1);

        return mv;
    }

    /**
     * 我要买车
     * @param keyword
     * @return
     */
    @RequestMapping("/buyCar")
    public ModelAndView buyCar(String keyword){

        ModelAndView mv= new ModelAndView();
        //查询 汽车 列表
        PageInfo<CarInfoBo> pageInfo = carInfoService.selectCarInfoList(keyword);

        //获取推荐 汽车信息
        List<CarInfoBo> recommend= (List<CarInfoBo>) redisUtils.get("recommend");
        mv.addObject("recommend",recommend);
        //页面信息
        mv.addObject("pageInfo",pageInfo);
        //🚵汽车信息
        mv.addObject("carInfoList", pageInfo.getList());
        mv.addObject("page",3);
        mv.setViewName("buycar_list");
      //  System.out.println(session.getAttribute("username"));
        return mv;
    }

    /**
     * 获取汽车列表（分页）
     * @param param
     * @return
     */
    @RequestMapping("/getCar")
    public ModelAndView buyCar(   PageParam param){

        ModelAndView mv= new ModelAndView();
            //查询 汽车 列表(分页)
        PageInfo<CarInfoBo>  pageInfo = carInfoService.selectCarInfoListByCondition(param);


        //获取推荐 汽车信息
        List<CarInfoBo> recommend= (List<CarInfoBo>) redisUtils.get("recommend");
        mv.addObject("recommend",recommend);
        //页面信息
        mv.addObject("pageInfo",pageInfo);
        //🚵汽车信息
        mv.addObject("carInfoList", pageInfo.getList());
        mv.setViewName("buycar_list");
        //  System.out.println(session.getAttribute("username"));
        return mv;
    }

    /**
     * 汽车售卖
     * @return
     */
    @RequestMapping("/sellCar")
    public ModelAndView sellCar(){
        ModelAndView mv=new ModelAndView();

        mv.addObject("page",4);
        mv.setViewName("sellcar");
        return mv;
    }

    /**
     * 关于
     * @return
     */
    @RequestMapping("/about")
    public ModelAndView about(){
        ModelAndView mv=new ModelAndView();

        mv.addObject("page",2);
        mv.setViewName("about");
        return mv;
    }


    /**
     * 汽车详情信息
     * @param session
     * @param carId
     * @return
     */
    @RequestMapping("/carInfo")
    public ModelAndView carInfo(HttpSession session, @RequestParam("id") String carId){
        ModelAndView mv=new ModelAndView();

        //查询 汽车 列表
        CarInfoDetailBo carInfoDetailBo = carInfoService.selectCarInfoDetail(carId);
        mv.setViewName("car_info");
        mv.addObject("car",carInfoDetailBo);
        return mv;
    }

}

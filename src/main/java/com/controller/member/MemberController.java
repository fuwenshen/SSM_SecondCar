package com.controller.member;

import com.base.BasicRespMessage;
import com.bean.User;
import com.dto.bo.OrderCountBo;
import com.dto.bo.UserBo;
import com.dto.param.UpdatePasswordParam;
import com.dto.param.UserParam;
import com.service.api.UserInfoApi;
import com.service.menber.MemberService;
import com.util.MD5Util;
import com.util.RedisUtils;
import com.util.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by FWS on 2018/3/19.
 */

@Controller
@RequestMapping("/ysCar/member")
public class MemberController {


    @Autowired
    private MemberService memberService;
    @Autowired
    RedisUtils redisUtils;
    @Autowired
    UserInfoApi userInfoApi;


    /**
     * 登录验证
     * @param request
     * @param param
     * @return
     */
    @RequestMapping(value = "/checklogin",method = RequestMethod.POST)
    @ResponseBody
    public BasicRespMessage checkLogin(HttpServletRequest request, @RequestBody UserParam param){

        BasicRespMessage resp =new BasicRespMessage();
        // check login
         User user= memberService.checkLogin(param);
         // 检查是否激活
         if(user.getUstatus()==0){
             return  resp.autoFilled(2,"该账户未激活，请及时激活");
         }

        if (user != null && user.getUpassword().equals(MD5Util.encode2hex(param.getPassword()))) {
            HttpSession session =request.getSession();
            session.setAttribute("username",user.getUsername());
            session.setAttribute("email",user.getUemail());

            // 储存用户信息至redis
            redisUtils.set(user.getUemail(),user);
            System.out.println(session.getAttribute("username").toString());
            return resp.autoFilled(1,"登录成功！");
        }
        return resp.autoFilled(0,"登陆失败！请重新登录！");
    }


    /**
     * 用户注册
     * @param param
     * @return
     */
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    @ResponseBody
    public BasicRespMessage regist(@RequestBody UserParam param) throws ServiceException {
        BasicRespMessage resp =new BasicRespMessage();
            //注册
            int result=memberService.processRegister(param);
        if(result==1){
            return resp.autoFilled(result,"注册成功！请48小时内进入邮箱内激活!");
        }
        if (result==2){
            return resp.autoFilled(result,"该邮箱已被使用!");
        }
        if (result==3){
            return resp.autoFilled(result,"用户名已存在！");
        }
        return resp.autoFilled(0,"注册失败！");
    }

    /**
     *  激活  账户  并且登陆
     * @param request
     * @return
     */
    @RequestMapping("/activate")
    public String activate(HttpServletRequest request, Model model){
        //激活
        try {
            User user=memberService.processActivate(request);//调用激活方法
            //激活成功  直接登陆
            if (user!=null) {
                HttpSession session=request.getSession();
                session.setAttribute("username",user.getUsername());
                session.setAttribute("email",user.getUemail());
                // 储存用户信息至redis
                redisUtils.set(user.getUemail(),user);
                // 重定向到会员界面
                return "redirect:/ysCar/member/memberVip";
            }
        } catch (Exception e) {

        }

        return null;
    }


    @PostMapping("test")
    public String test( ){

        return "123";
    }

    //登录验证
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public ModelAndView login( HttpServletRequest request, UserParam param){
        ModelAndView mv=new ModelAndView();
        User user= memberService.checkLogin(param);
        if (user != null && user.getUpassword().equals(param.getPassword())) {
            HttpSession session =request.getSession();
            session.removeAttribute("username");
            session.setAttribute("username",user.getUsername());
            System.out.println(session.getAttribute("username").toString());
                 System.out.println("UCK:"+param.getId());
        }
        mv.setViewName("testJsp");
        return mv;
    }

    /**
     * 用户退出登录
     * @param session
     * @return
     */
    @RequestMapping(value = "/logout")
    public ModelAndView logout( HttpSession session){
        ModelAndView mv=new ModelAndView();
            session.invalidate();
            System.out.println("销毁seesion");

        mv.setViewName("index");
        return mv;
    }

    /**
     *  会员  首页
     * @return
     */
    @RequestMapping("/memberVip")
    public ModelAndView menberVip( HttpSession session){
        ModelAndView mv=new ModelAndView();
        // 获取 用户信息
        UserBo userBo = userInfoApi.getUserBo(session);
        //获取数量信息
        OrderCountBo countBo =memberService.getOrderCount(userBo.getId());
        //数量
        mv.addObject("count",countBo);
        //用户信息
        mv.addObject("userInfo",userBo);
        mv.addObject("page",5);
        mv.setViewName("member/menberVip");
        return mv;
    }



    /**
     *  账户管理
     * @return
     */
    @RequestMapping("/manager")
    public ModelAndView manager(HttpSession session){
        ModelAndView mv= new ModelAndView();
        // 获取 用户信息
        UserBo userBo = userInfoApi.getUserBo(session);
        mv.addObject("userInfo",userBo);
        mv.addObject("page",5);
        mv.setViewName("member/manager");
        return mv;
    }

    /**
     * 修改用户信息
     * @param param
     * @return
     */
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public BasicRespMessage update(@RequestBody UserParam param){
        BasicRespMessage resp =new BasicRespMessage();
        //更新
        int result=memberService.updateUserInfo(param);

        if(result==1){
          User user =userInfoApi.getUserByUserId(param.getId());
            // 储存用户信息至redis
            redisUtils.set(user.getUemail(),user);
            return resp.autoFilled(result);
        }
        return resp.autoFilled(result);
    }

    /**
     * 密码修改
     * @param param
     * @return
     * @throws ServiceException
     */
    @RequestMapping(value = "/updatePassword",method = RequestMethod.POST)
    @ResponseBody
    public BasicRespMessage updatePassword(@RequestBody UpdatePasswordParam param) {
        BasicRespMessage resp =new BasicRespMessage();

        int result=memberService.updatePassword(param);

        return resp.autoFilled(result);
    }
}

package com.service.menber.impl;

import com.bean.FavKey;
import com.bean.Order;
import com.bean.User;
import com.dao.FavMapper;
import com.dao.OrderMapper;
import com.dao.UserMapper;
import com.dto.bo.OrderCountBo;
import com.dto.param.UpdatePasswordParam;
import com.dto.param.UserParam;
import com.service.menber.MemberService;
import com.util.EmailUtil;
import com.util.MD5Util;
import com.util.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * Created by FWS on 2018/3/19.
 */
@Service
public class MemberServiceImpl  implements MemberService{

    @Autowired
    private UserMapper userMapper;
    @Autowired
    OrderMapper orderMapper;
    @Autowired
    FavMapper favMapper;

    /**
     *  检测 登录的正确性
     * @param param
     * @return
     */
    public User checkLogin(UserParam param) {

        User user = userMapper.selectByUemail(param.getEmail());

       return user;
    }



    /**
     *  注册  并发送邮箱
     * @param param
     * @return
     * @throws ServiceException
     */
    public int processRegister(UserParam param) throws ServiceException {

        User checkUser = userMapper.selectByUsername(param.getUsername());
        if (checkUser == null) {
            checkUser = userMapper.selectByUemail(param.getEmail());
            if (checkUser == null) {

                User user = new User();
                Random random = new Random();
                int result = random.nextInt(60000) % 30001 + 30000;

                user.setUid(String.valueOf(result));
                user.setUsername(param.getUsername());
                user.setUemail(param.getEmail());
                user.setUpassword(MD5Util.encode2hex(param.getPassword()));
                user.setUphone(param.getPhone());
                user.setUregistertime(new Date());
                user.setUvalidatecode(MD5Util.encode2hex(param.getEmail())); //将邮箱做MD5加密后用作激活码
                user.setUstatus((byte) 0);
                //入库
                userMapper.insert(user);

                //  组装 激活码！
                StringBuffer sb = new StringBuffer("点击下面链接激活账号，48小时生效，否则重新注册账号，链接只能使用一次，请尽快激活！</br>");
                sb.append("<a href=\"http://localhost:8080/ysCar/member/activate?email=");
                sb.append(user.getUemail());
                sb.append("&validateCode=");
                sb.append(user.getUvalidatecode());
                sb.append("\">http://localhost:8080/ysCar/member/activate?email=");
                sb.append(user.getUemail());
                sb.append("&validateCode=");
                sb.append(user.getUvalidatecode());
                sb.append("</a>");

                //发送邮件
                EmailUtil.send(user.getUemail(), sb.toString());
                System.out.println("发送邮件");
                return 1;
            }else{
//                throw new ServiceException("该邮箱已被使用！");
                return 2;
            }
        }else {
          //  throw new ServiceException("用户名已存在！");
            return 3;
        }
    }

    public int updateUserInfo(UserParam param) {

       User user = new User();

       user.setUid(param.getId());
       user.setUname(param.getName());
       user.setUsername(param.getUsername());
       user.setUphone(param.getPhone());
       user.setUage(param.getAge());
       userMapper.updateByPrimaryKeySelective(user);


       return 1;
    }

    /**
     * 更改用户密码
     * @param param
     * @return
     */
    public int updatePassword(UpdatePasswordParam param) {

        User user = userMapper.selectByPrimaryKey(param.getId());

        if(!user.getUpassword().equals(MD5Util.encode2hex(param.getOldPassword()))){
            //密码错误
            return 4;
        }
        //设置新密码
        user.setUpassword(MD5Util.encode2hex(param.getNewPassword()));

        userMapper.updateByPrimaryKeySelective(user);
        return 1;
    }

    /**
     * 获取订单数量/收藏数量
     * @param userId
     * @return
     */
    public OrderCountBo getOrderCount(String userId) {

        OrderCountBo bo=new OrderCountBo();
        List<Order> orders=orderMapper.selectByBid(userId);
        List<FavKey> favKeys=favMapper.selectByUid(userId);

        bo.setOrderCount(orders.size());
        bo.setFavCount(favKeys.size());
        return bo;
    }


    /**
     * 激活邮箱
     * @param request
     */
    public User processActivate(HttpServletRequest request) throws ServiceException {

        //数据访问层，通过email获取用户信息
        User user=userMapper.selectByUemail(request.getParameter("email"));

        //验证用户是否存在
        if(user!=null) {
            //验证用户激活状态
            if(user.getUstatus()==0) {
                ///没激活
                Date currentTime = new Date();//获取当前时间
                    //验证链接是否过期
                    //

                    //验证激活码是否正确
                    if(request.getParameter("validateCode").equals(user.getUvalidatecode())) {
                        //激活成功 , 把状态改为激活
                        user.setUstatus((byte) 1);
                        // 更新
                        userMapper.updateByPrimaryKey(user);
                        return user;
                    } else {
                        throw new ServiceException("激活码不正确");
                    }

                }else {
                throw new ServiceException("邮箱已激活，请登录！");
            }
        } else {
            throw new ServiceException("该邮箱未注册（邮箱地址不存在）！");
        }
    }

}

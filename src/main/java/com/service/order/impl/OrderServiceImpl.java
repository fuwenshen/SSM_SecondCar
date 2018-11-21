package com.service.order.impl;

import com.bean.*;
import com.dao.*;
import com.dto.bo.CarInfoBo;
import com.dto.bo.HistoryBo;
import com.dto.bo.OrderBo;
import com.dto.bo.UserBo;
import com.service.api.CarInfoApi;
import com.service.api.FinishOrderApi;
import com.service.api.UserInfoApi;
import com.service.order.OrderService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * Created by FWS on 2018/4/2.
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CarInfoMapper carInfoMapper;
    @Autowired
    private HistoryMapper historyMapper;
    @Autowired
    private PicMapper picMapper;
    @Resource
    CarChassisBrakeInfoMapper carChassisBrakeInfoMapper;
    @Resource
    CarEngineInfoMapper carEngineInfoMapper;
    @Resource
    CarExternalInfoMapper carExternalInfoMapper;
    @Resource
    CarInternalInfoMapper carInternalInfoMapper;
    @Resource
    CarSafetyInfoMapper carSafetyInfoMapper;
    @Autowired
    private FavMapper favMapper;
    @Autowired
    private CarInfoApi carInfoApi;
    @Autowired
    private UserInfoApi userInfoApi;
    @Autowired
    private FinishOrderApi finishOrderApi;

    /**
     *  没完成订单
     * @param userId
     * @return
     */
    public List<OrderBo> getUnfinshOrder(String userId) {

        List<OrderBo> orderBos = new ArrayList();
        List<Order> orderList = orderMapper.selectByBid(userId);

        for (Order order:orderList) {
            // 未完成订单
            if("0".equals(order.getOrderStatus())){
                getOrderBo(orderBos, order);
            }

        }
        return orderBos;
    }


    /**
     * 已完成订单
     * @param userId
     * @return
     */
    public List<OrderBo> getFinshOrder(String userId) {
        List<OrderBo> orderBos = new ArrayList();
        List<Order> orderList = orderMapper.selectByBid(userId);

        for (Order order:orderList) {
            // 以完成完成订单
            if("1".equals(order.getOrderStatus())){
                //获取订单bo
                getOrderBo(orderBos, order);
            }

        }
        return orderBos;
    }

    /**
     *  获取订单Bo
     * @param orderBos
     * @param order
     */
    private void getOrderBo(List<OrderBo> orderBos, Order order) {
        OrderBo bo = new OrderBo();
        //获取卖家信息
        User seller = userMapper.selectByPrimaryKey(order.getSellerId());


        if("0".equals(order.getOrderStatus())){
            order.setOrderStatus("未完成");
        }else {
            order.setOrderStatus("已完成");
        }
        //用户数据不全 可能为空 引起空指针异常
        if(seller != null){
            String phone = seller.getUphone();
            bo.setPhone(phone);
        }else {
            bo.setPhone("400-888-6666");
        }

        // 查询汽车信息
        CarInfoBo carInfoBo=carInfoApi.getCarInfoBoByCarId(order.getCarId());

        bo.setCarInfo(carInfoBo);
         // add 订单
        bo.setOrder(order);
        orderBos.add(bo);
    }

    /**
     * 创建订单
     * @param userId
     * @param carId
     * @return
     */
    public int createOrder(String userId, String carId) {

        // 通过汽车id 查看是否有重复订单
        List<Order> orders = orderMapper.selectByBid(userId);
        for (Order order: orders) {
            if(order.getCarId().equals(carId))
                return 2;
        }
        //添加新订单
        Random random = new Random();
        int result = random.nextInt(60000) % 30001 + 30000;
        String order_id = String.valueOf(result); // 生产订单
        // 获取carInfo
        CarInfo carInfo = carInfoMapper.selectByPrimaryKey(carId);
        String sellerId = carInfo.getUid();
        //获取系统时间测试
        Date dt=new Date();//如果不需要格式,可直接用dt,dt就是当前系统时间
//        System.out.println("ddd:"+dt);
//        DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//设置显示格式
//        String nowTime="";
//        nowTime= df.format(dt);
//        System.out.println(nowTime);

//        创建订单
        Order  order = new Order(order_id,carId,carInfo.getConfName(),carInfo.getPrice(),carInfo.getPrice()*0.1,sellerId,carInfo.getAddress(),userId,dt,"0");
        orderMapper.insert(order);
        return 1;
    }

    /**
     * 历史订单 （管理员）
     * @param user_id
     * @return
     */
    public List<HistoryBo> getHistory(String user_id) {

        List<History> histories = historyMapper.selectByBuyerId(user_id);
        List<HistoryBo> historyBos = new ArrayList<HistoryBo>();

        for (History history:histories) {
            CarInfo carInfo = carInfoMapper.selectByPrimaryKey(history.getCarId());
            User user = userMapper.selectByPrimaryKey(history.getSellerId());

            HistoryBo historyVo = new HistoryBo();
            historyVo.setCarInfo(carInfo);
            historyVo.setUser(user);
            historyBos.add(historyVo);
        }
        return historyBos;
    }

    /**
     *  收藏夹
     * @param userId
     * @return
     */
    public  List<CarInfoBo> getMyFavorite(String userId) {

        // 获取fav 数据
        List<FavKey> favKeyList = favMapper.selectByUid(userId);

        List<CarInfoBo> carInfoBo= new ArrayList<CarInfoBo>();
        // 获取汽车数据
        for (FavKey favKey:favKeyList) {
            String carId=favKey.getCarId();
            // 获取 汽车信息
            CarInfoBo carBo = carInfoApi.getCarInfoBoByCarId(carId);
            // 获取卖家信息
            UserBo userBo = userInfoApi.getUserBoByUserId(carBo.getUid());
            //设置卖家电话号码
            if(userBo!=null){
                carBo.setPhone(userBo.getPhone());
            }else {
                carBo.setPhone("400-888-6666");
            }
            //添加进去
            carInfoBo.add(carBo);

        }

        return carInfoBo;
    }

    /**
     * 完成订单
     * @param userId
     * @param carId
     * @return
     */
    public int finishOrder(String userId, String carId) {
        return 0;
    }


    /**
     * 获取卖家未确认订单列表
     * @param userId
     * @return
     */
    public List<OrderBo> checkOrder(String userId) {

        // 通过卖家id获取订单
        List<Order> orderList = orderMapper.selectBySid(userId);
        //所有的订单列表
        List<OrderBo> orderBos = new ArrayList<OrderBo>();


        for (Order order:orderList) {

            if("0".equals(order.getOrderStatus())){
                order.setOrderStatus("未完成");
                String phone=null;
                OrderBo bo = new OrderBo();
                // 通过卖家id 获取信息卖家用户信息
                User seller = userMapper.selectByPrimaryKey(order.getBuyerId());
                if(seller != null){
                    phone = seller.getUphone();
                }
                bo.setPhone(phone);
                bo.setOrder(order);
                orderBos.add(bo);
            }
        }
        return orderBos;
    }

    /**
     * 卖家确认订单
     * @param orderId
     * @return
     */
    @Transactional
    public int confirmOrder(String orderId) {
        // 获取订单
        Order orderTemp = orderMapper.selectByPrimaryKey(orderId);
        //改变汽车状态为已被预订
        String carId = orderTemp.getCarId();
        CarInfo carInfo = carInfoMapper.selectByPrimaryKey(carId);
        carInfo.setIslocked("已被预订");
        carInfoMapper.updateByPrimaryKey(carInfo);
        //改变订单为已确认
        orderTemp.setOrderStatus("1");
        orderMapper.updateByPrimaryKey(orderTemp);

        // 卖家确认订单之后订单完成，生成历史订单
        finishOrderApi.createHistoryOrder(orderTemp.getBuyerId(),orderTemp.getSellerId(),orderTemp.getCarId());
        return 1;
    }

    /**
     * 获取卖家历史订单
     * @param userId
     * @return
     */
    public List<HistoryBo> getSellHistory(String userId) {
        //获取卖家历史列表
        List<History> histories = historyMapper.selectBySellerId(userId);
        List<HistoryBo> itemsList = new ArrayList<HistoryBo>();

        for (History history:histories) {
            // 获取汽车信息
            CarInfo carInfo = carInfoMapper.selectByPrimaryKey(history.getCarId());
            // 获取买家信息
            User user = userMapper.selectByPrimaryKey(history.getBuyerId());
            HistoryBo historyBo = new HistoryBo();
            historyBo.setCarInfo(carInfo);
            historyBo.setUser(user);
            itemsList.add(historyBo);
        }
        return itemsList;
    }


    /**
     * 获取卖家发布的车辆
     * @param userId
     * @return
     */
    public List<CarInfoBo> getSellingCars(String userId) {
        //获取卖家汽车列表
        List<CarInfo> itemsListTempt = carInfoMapper.selectByUid(userId);
        List<CarInfoBo> carInfoBos = new ArrayList<CarInfoBo>();
        for (CarInfo carInfo:itemsListTempt) {
            //  可出售  极为预出售状态，还可以撤销
            if(carInfo.getIslocked().equals("可出售")){
                CarInfoBo carInfoBo=new CarInfoBo();
                BeanUtils.copyProperties(carInfo,carInfoBo);
                carInfoBos.add(carInfoBo);
            }
        }
        return carInfoBos;
    }

    /**
     * 撤销发布车辆
     * @param carId
     * @return
     */
    @Transactional
    public int cancelSell(String carId) {

        //从车辆信息中去除
        carInfoMapper.deleteByPrimaryKey(carId);
        carChassisBrakeInfoMapper.deleteByPrimaryKey(carId);
        carEngineInfoMapper.deleteByPrimaryKey(carId);
        carExternalInfoMapper.deleteByPrimaryKey(carId);
        carInternalInfoMapper.deleteByPrimaryKey(carId);
        carSafetyInfoMapper.deleteByPrimaryKey(carId);

        return 1;
    }

    public int delOrder(String orderId) {

        //删除未完成订单
        orderMapper.deleteByPrimaryKey(orderId);
        return 1;
    }

}

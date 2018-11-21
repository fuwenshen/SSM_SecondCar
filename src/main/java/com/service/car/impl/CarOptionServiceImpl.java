package com.service.car.impl;

import com.bean.*;
import com.dao.*;
import com.dto.param.CarInfoParams;
import com.service.car.CarOptionService;
import com.util.FileUploadUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Random;

/**
 * Created by FWS on 2018/4/12.
 */
@Service
public class CarOptionServiceImpl implements CarOptionService{

    @Autowired
    PicMapper picMapper;
    @Resource
    CarInfoMapper carInfoDao;
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
    @Resource
    UserMapper userMapper;

    public void saveCarInfo(HttpServletRequest request, final CarInfoParams params) {


        String userId="74360"; ///  测试
        //  生成carId
        Random random = new Random();
        int carId = random.nextInt(60000) % 26001 + 34000;


        CarInfo carInfo = new CarInfo();

        // 图片路径
        final String path=request.getServletContext().getRealPath("/resources/img/carPic");

        if(params.getCarPic().size()>0){
            //开启线程加载图片
            new Thread(new Runnable() {
                public void run() {
                    // 加载图片 至  /resources/img/carPic
                    FileUploadUtil.fileUploadByTransto(path,params.getCarPic());
                }
            }).start();

            for (CommonsMultipartFile file:params.getCarPic() ) {
                Pic pic= new Pic();
                // 随机生产 picId
                int picId = random.nextInt(60000) % 26001 + 34000;
                // 获取 图片原名字
                String fileName=file.getOriginalFilename();
                // 生产图片路径
                String picUrl="/img/carPic/"+fileName;
                pic.setPicUrl(picUrl);
                pic.setCarId(String.valueOf(carId));
                pic.setPicId(String.valueOf(picId));
                // 插入图片库
                picMapper.insert(pic);

            }

            /**
             * 插入carInfo 库 (其他库)
             */

            // 汽车库（汽车信息）
            BeanUtils.copyProperties(params,carInfo);
            carInfo.setCarId(String.valueOf(carId));
            carInfo.setIslocked("待审核");
            carInfo.setUid(userId);
            carInfoDao.insert(carInfo);

            // 其他库
            CarChassisBrakeInfo carChassisBrakeInfo=new CarChassisBrakeInfo();
            CarEngineInfo carEngineInfo=new CarEngineInfo();
            CarExternalInfo carExternalInfo=new CarExternalInfo();
            CarInternalInfo carInternalInfo=new CarInternalInfo();
            CarSafetyInfo carSafetyInfo=new CarSafetyInfo();

            carChassisBrakeInfo.setCarId(String.valueOf(carId));
            carChassisBrakeInfoMapper.insert(carChassisBrakeInfo);

            carEngineInfo.setCarId(String.valueOf(carId));
            carEngineInfoMapper.insert(carEngineInfo);

            carExternalInfo.setCarId(String.valueOf(carId));
            carExternalInfoMapper.insert(carExternalInfo);

            carInternalInfo.setCarId(String.valueOf(carId));
            carInternalInfoMapper.insert(carInternalInfo);

            carSafetyInfo.setCarId(String.valueOf(carId));
            carSafetyInfoMapper.insert(carSafetyInfo);
        }




    }

}

package com.controller;

import com.base.BasicRespMessage;
import com.dao.CarInfoMapper;
import com.dto.param.TestParams;
import com.util.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

/**
 * Created by FWS on 2018/3/27.
 */
@RestController
public class TestController {

    @Autowired
    private CarInfoMapper carInfoMapper;
    @Autowired
    RedisUtils redisUtils;
    @RequestMapping("/test")
    @ResponseBody
    public BasicRespMessage Test(){
        BasicRespMessage resp= new BasicRespMessage();

//        CarInfo carInfo = carInfoMapper.selectByPrimaryKey("10568");
//        List<CarInfo> carInfos = carInfoMapper.selectCarInfoAll();

        // System.out.println("sessionID =="+request.getSession().getId());
        redisUtils.set("fws","付文深123");
        String fws= (String) redisUtils.get("fws");
        resp.setBody(fws);
        return resp.autoFilled(1);
    }


    @RequestMapping("/testSession")
    public ModelAndView testSession(HttpSession session){
        ModelAndView mv = new ModelAndView();

        session.setAttribute("test1","fuwenshen");
        System.out.println("sessionID =="+session.getId());
        mv.setViewName("testJsp");
        return mv;
    }

    @RequestMapping("/testSession1")
    @ResponseBody
    public BasicRespMessage testSession1(HttpSession session, @RequestBody TestParams params){
        BasicRespMessage resp= new BasicRespMessage();

        session.setAttribute("test2","fuwenshen2");
        resp.setBody("test");
        return resp.autoFilled(1);
    }

    @RequestMapping("/testSession2")
    @ResponseBody
    public BasicRespMessage testSession2(){
        BasicRespMessage resp= new BasicRespMessage();

       // session.setAttribute("test2","fuwenshen2");
        resp.setBody("test");
        return resp.autoFilled(1);
    }


















    /*
     * 采用file.Transto 来保存上传的文件
     */
    @RequestMapping("/fileUpload2")
    @ResponseBody
    public String  fileUpload2(HttpServletRequest request ,@RequestParam("file") List<CommonsMultipartFile> file1) throws IOException {
        long  startTime=System.currentTimeMillis();
        for (CommonsMultipartFile file:file1){
            System.out.println("fileName："+file.getOriginalFilename());
            System.out.println("fileNameNoEX："+getFileName(file.getOriginalFilename()));
//        String path="F:/"+new Date().getTime()+file.getOriginalFilename();
//        File newFile=new File(path);
            //路径
            String path2=request.getServletContext().getRealPath("/resources/images1");
            String fileName=file.getOriginalFilename();
            File newFile=new File(path2,fileName);

            //判断路径是否存在，如果不存在就创建一个
            if(!newFile.getParentFile().exists()){
                newFile.getParentFile().mkdirs();
            }

            //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
            file.transferTo(newFile);

        }
        long  endTime=System.currentTimeMillis();

        System.out.println("方法二的运行时间："+String.valueOf(endTime-startTime)+"ms");
        return "success";
    }


    /*
     *采用spring提供的上传文件的方法
     */
    @RequestMapping("/springUpload")
    public String  springUpload(HttpServletRequest request) throws IllegalStateException, IOException
    {
        long  startTime=System.currentTimeMillis();
        //将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
        CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
                request.getSession().getServletContext());
        //检查form中是否有enctype="multipart/form-data"
        if(multipartResolver.isMultipart(request))
        {
            //将request变成多部分request
            MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
            //获取multiRequest 中所有的文件名
            Iterator iter=multiRequest.getFileNames();

            while(iter.hasNext())
            {
                //一次遍历所有文件
                MultipartFile file=multiRequest.getFile(iter.next().toString());
                if(file!=null)
                {
                    String path="F:/springUpload"+file.getOriginalFilename();
                    //上传
                    file.transferTo(new File(path));
                }

            }

        }
        long  endTime=System.currentTimeMillis();
        System.out.println("方法三的运行时间："+String.valueOf(endTime-startTime)+"ms");
        return "/success";
    }

    public static String getFileName(String fileName){
        if(fileName!=null && fileName.length()>0){
            int dot=fileName.lastIndexOf('.');
            if(dot>-1 && dot< fileName.length()){
                return  fileName.substring(0,dot);
            }
        }
        return fileName;
    }
}

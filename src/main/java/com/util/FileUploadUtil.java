package com.util;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

/**
 * Created by FWS on 2018/4/10.
 * 上传文件工具
 */
public class FileUploadUtil {


    public static  final String PATH="/resources/img/carPic";
    /**
     * 采用file.Transto 来保存上传的文件
     * @return
     */
    public static void   fileUploadByTransto(String realPath, List<CommonsMultipartFile> files){
        for (CommonsMultipartFile file:files){
            System.out.println("fileName："+file.getOriginalFilename());
            //路径
            String path=realPath+PATH;
            // 文件名
            String fileName=file.getOriginalFilename();
            // 创建文件
            File newFile=new File(realPath,fileName);
            //判断路径是否存在，如果不存在就创建一个
            if(!newFile.getParentFile().exists()){
                newFile.getParentFile().mkdirs();
            }
            //通过CommonsMultipartFile的方法直接写文件
            try {
                file.transferTo(newFile);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    /**
     * 采用spring提供的上传文件的方法
     * @param request
     * @throws IllegalStateException
     * @throws IOException
     */
    public static void  fileUploadBySpring(HttpServletRequest request) throws IllegalStateException, IOException
    {
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
                // 一次遍历所有文件
                MultipartFile file=multiRequest.getFile(iter.next().toString());
                if(file!=null)
                {
                    String path=request.getServletContext().getRealPath("/resources/images/carPic")+file.getOriginalFilename();
                    //上传
                    file.transferTo(new File(path));
                }

            }

        }
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

package com.bookshare.utils;


import com.bookshare.pojo.PackageObject;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

public class UploadUtils {

    public static String uploadForm(String path, PackageObject object, HttpServletRequest request) {
        String newPath = null;
        //String savePath = request.getSession().getServletContext().getRealPath("/") + "WEB-INF/upload/"+path;
        String savePath = "C:/workspaces/bookshare/src/main/webapp/" + path;
        System.out.println(savePath);
        File targetFile = new File(savePath);
        //判断文件是否存在
        if (!targetFile.exists() && !targetFile.isDirectory()) {
            System.out.println(savePath + "目录不存在，需要创建");
            //创建目录
            targetFile.mkdirs();
        }
        //1.创建一个DiskFileItemFactory工厂
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //2.创建文件上传解析器
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax(4194304);
        //解决上传文件中的乱码问题
        upload.setHeaderEncoding("UTF-8");

        try {
            //4.使用ServletFileUpload解析器上传数据，解析结果是List<FileItem>集合，每个FileItem代表表单的一栏
            List<FileItem> list = upload.parseRequest(request);
            for (FileItem item : list) {
                //如果表单提交的是普通输入项
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    //解决中文乱码问题
                    String value = item.getString("UTF-8");
                    System.out.println(name + " " + value);
                    object.packageObject(name, value);
                } else {

                    //如果得到的是表单中的文件上传项
                    //得到文件的名字
                    String filename = item.getName();
                    if (filename == null && filename == "") {

                        continue;
                    }
                    //处理文件名，只保留文件名部分，去掉路径部分
                    filename = filename.substring(filename.indexOf("\\") + 1);
                    //获得文件输入流
                    InputStream in = item.getInputStream();
                    //创建文件输出流

                    newPath = savePath + "//" + filename;
                    FileOutputStream out = new FileOutputStream(newPath);
                    byte buffer[] = new byte[1024];
                    int len = 0;
                    while ((len = in.read(buffer)) > 0) {

                        out.write(buffer, 0, len);
                    }
                    //关闭输入流
                    in.close();
                    //关闭输出流
                    out.close();


                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return newPath;

    }

}

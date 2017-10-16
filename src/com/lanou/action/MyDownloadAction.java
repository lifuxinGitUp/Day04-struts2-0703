package com.lanou.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import sun.misc.BASE64Encoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

/**
 * Created by dllo on 17/10/13.
 */
public class MyDownloadAction extends ActionSupport {
    //    提供一个供下载的输入流对象, 作为动作的result返回参数传递给页面
    private InputStream inputStream;
    private String fileName; //要下载的文件名称

    /**
     * 文件下载
     **/
    public String download() {
        // 获得下载路径
        String dirPath = ServletActionContext.getServletContext().getRealPath("files");
//        fileName = "孔子.png"; // 初始化文件名称
        File file = new File(dirPath, fileName);
        try {
            // 构建输入流对象
            inputStream = new FileInputStream(file);
            // 将文件包含中文的部分进行浏览器兼容的处理, 放在inputStream赋值之后,动作方法返回之前
            fileName = filenameEncoding(fileName,ServletActionContext.getRequest(), ServletActionContext.getResponse());

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return SUCCESS;
    }
//    处理浏览器文件下载包含中文的问题
//    要进行中文处理的源文件名称
//    返回要处理源文件的名称
    public String filenameEncoding(String filename, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String agent = request.getHeader("User-Agent");
        //         System.out.println(agent);
        if (agent.contains("Firefox")) {
            BASE64Encoder base64Encoder = new BASE64Encoder();
            filename = "=?utf-8?B?" + base64Encoder.encode(filename.getBytes("utf-8")) + "?=";
        } else if (agent.contains("MSIE")) {
            filename = URLEncoder.encode(filename, "utf-8");
        } else if (agent.contains("Safari")) {
            filename = new String(filename.getBytes("UTF-8"), "ISO8859-1");
        } else {
            filename = URLEncoder.encode(filename, "utf-8");
        }
        return filename;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
}

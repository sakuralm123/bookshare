package com.bookshare.controller;

import com.bookshare.mapper.BookMapper;
import com.bookshare.pojo.Book;
import com.bookshare.service.BookService;
import com.bookshare.utils.UUIDUtils;
import com.bookshare.utils.UploadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;


    /**
     * 获得图书的信息
     */
    @RequestMapping("/bookinfo")
    public String bookInfo(Model model, HttpServletResponse response, HttpServletRequest request){
        String bid=request.getParameter("bid");
        Book book = bookService.bookInfo(bid);
        System.out.println(book);
        model.addAttribute("bookinfo",book);
        return "bookinfo";

    }

    /**
     * 上传图书
     */
    @RequestMapping("/upload")
    public String uploadBook(Model model ,HttpServletRequest request,HttpServletResponse response){
        Book book=new Book();
        String newPath= UploadUtils.uploadForm("book",book,request);
        book.setBpict(newPath);
        //是否可行，存疑。
        String uid= (String) request.getSession().getAttribute("uid");
        book.setBuid(uid);
        book.setBid(UUIDUtils.getUUID());

        int flag=bookService.uploadBook(book);
        if (flag==1){
            model.addAttribute("result","上传成功");
        }else{
            model.addAttribute("result","上传失败,请重试");
        }
        return "bookupload";
    }
}

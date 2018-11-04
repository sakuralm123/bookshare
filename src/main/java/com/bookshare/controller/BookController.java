package com.bookshare.controller;

import com.bookshare.mapper.BookMapper;
import com.bookshare.pojo.Book;
import com.bookshare.service.BookService;
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
        System.out.println(bid);
        Book book = bookService.bookInfo(bid);
        System.out.println(book);
        model.addAttribute("bookinfo",book);
        return "bookinfo";

    }
}

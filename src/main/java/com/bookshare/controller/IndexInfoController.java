package com.bookshare.controller;

import com.bookshare.pojo.Book;
import com.bookshare.service.BookService;
import com.bookshare.service.IndexInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import sun.misc.Request;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class IndexInfoController {
    @Autowired
    private IndexInfoService indexInfoService;

    @RequestMapping("/index")
    public String indexInfo(Model model, HttpServletRequest request){
        List<Book> turnBook=indexInfoService.turnBook();
        System.out.println(turnBook);
        List<Book> books=indexInfoService.findBook();
        System.out.println(books);
        model.addAttribute("turnBook",turnBook);
        model.addAttribute("books",books);
        return "index";
    }

    @RequestMapping("/beforusercentor")
    public String beforUserCentor(){
        return "usercentor";
    }

    @RequestMapping("/beforlogin")
    public String beforLogin(){
        return "login";
    }

}

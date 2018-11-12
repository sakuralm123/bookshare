package com.bookshare.controller;

import com.bookshare.pojo.Book;
import com.bookshare.service.BookService;
import com.bookshare.utils.UUIDUtils;
import com.bookshare.utils.UploadUtils;
import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;


    /**
     * 获得图书的信息
     */
    @RequestMapping("/bookinfo")
    public String bookInfo(Model model, HttpServletResponse response, HttpServletRequest request) {
        String bid = request.getParameter("bid");
        Book book = bookService.bookInfo(bid);
        System.out.println(book);
        model.addAttribute("bookinfo", book);
        return "bookinfo";
    }

    /**
     * 上传图书
     */
    @RequestMapping("/upload")
    public String uploadBook(Model model, HttpServletRequest request, HttpServletResponse response) {
        Book book = new Book();
        String newPath = UploadUtils.uploadForm("book", book, request);
        //把存入数据库中的路径改变
        String[] strings=newPath.split("/");
        newPath="/book/"+strings[strings.length-1];
        book.setBpict(newPath);
        String uid = (String) request.getSession().getAttribute("uid");
        book.setBuid(uid);
        book.setBid(UUIDUtils.getUUID());

        int flag = bookService.uploadBook(book);
        if (flag == 1) {
            model.addAttribute("result", "上传成功");
        } else {
            model.addAttribute("result", "上传失败,请重试");
        }
        return "bookupload";
    }


    /**
     * 模糊查询图书
     * @param model
     * @param request
     * @return
     */

    @RequestMapping("/fuzzysearch")
    public String fuzzysearch(Model model, HttpServletRequest request) {
        String bname=request.getParameter("bname");
        List<Book> books=bookService.fuzzysearch(bname);
        model.addAttribute("books",books);
        return "booklist";
    }

    /**
     * 按分类查询图书
     * @param
     * @param request
     * @return
     */
    @RequestMapping("/categorysearch")
    public String categorysearch(Model model, HttpServletRequest request ){
        String bcate=request.getParameter("bcate");
        System.out.println(bcate);

        String pageNum = request.getParameter("page");
        String pageSize = request.getParameter("size");
        int beginnum = 1;
        int beginsize = 4;
        if(pageNum != null && !"".equals(pageNum)){
            beginnum = Integer.parseInt(pageNum);
        }
        if(pageSize != null && !"".equals(pageSize)){
            beginsize  = Integer.parseInt(pageSize);
        }
        String sortString = "id.desc";
        Order.formString(sortString);
        PageHelper.startPage(beginnum, beginsize);
        List<Book> books=bookService.categorysearch(bcate);
        //System.out.println(books);
        PageInfo<Book> pagehelper = new PageInfo<Book>(books);
        //System.out.println(books.size());
        model.addAttribute("bcate",bcate);
        model.addAttribute("books",pagehelper.getList());
        System.out.println(pagehelper.getList());
        model.addAttribute("total",pagehelper.getTotal());
        model.addAttribute("pindex",beginnum);
        return "booklist";
    }

    @RequestMapping("/pagecut")
    @ResponseBody
    public int pageCut(HttpServletRequest request ){
        String bcate=request.getParameter("bcate");
        System.out.println(bcate);
        String pageNum = request.getParameter("page");

        String pageSize = request.getParameter("size");
        int beginnum=1;
        int beginsize=4;
        if(pageNum != null && !"".equals(pageNum)){
            beginnum = Integer.parseInt(pageNum);
        }
        if(pageSize != null && !"".equals(pageSize)){
            beginsize  = Integer.parseInt(pageSize);
        }
        String sortString = "id.desc";
        Order.formString(sortString);
        PageHelper.startPage(beginnum, beginsize);
        List<Book> books=bookService.categorysearch(bcate);
        System.out.println(books);
        PageInfo<Book> pagehelper = new PageInfo<Book>(books);
        //System.out.println(books.size());
       // model.addAttribute("bcate",bcate);
        //model.addAttribute("books",pagehelper.getList());
       // System.out.println(pagehelper.getList());
        //model.addAttribute("total",pagehelper.getTotal());
        return 1;
    }



    /**
     * 查看用户所有上传的图书
     */
    @RequestMapping("/allupload")
    public String allUpload(Model model,HttpServletRequest request){
        String buid= (String) request.getSession().getAttribute("uid");
        List<Book> bookList=bookService.allUpload(buid);
        model.addAttribute("bookList",bookList);
        return "allupload";
    }

    /*@RequestMapping("/reques")
    public String paging(Model model,HttpServletRequest request){

    }
*/


}

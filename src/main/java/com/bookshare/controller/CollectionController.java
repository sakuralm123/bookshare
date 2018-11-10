package com.bookshare.controller;

import com.bookshare.pojo.Book;
import com.bookshare.pojo.CollectionInfo;
import com.bookshare.service.CollectionService;
import com.bookshare.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class CollectionController {
    @Autowired
    private CollectionService collectionService;

    /**
     * 展示所有的收藏列表
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/allcollection")
    public String allCollection(Model model, HttpServletRequest request) {
        String buid= (String) request.getSession().getAttribute("uid");
        List<String> bids=collectionService.allbids(buid);
        List<Book> books=collectionService.allBooks(bids);
        model.addAttribute("books",books);
        return "bookcollection";
    }

    /**
     * 点击收藏按钮触发的操作
     */
    @RequestMapping("/collection")
    public String collection(Model model,HttpServletRequest request){
        CollectionInfo collection=new CollectionInfo();
       String cuid= (String) request.getSession().getAttribute("uid");
       String cbid=request.getParameter("cbid");
       collection.setCbid(cbid);
       collection.setCuid(cuid);
       collection.setCid(UUIDUtils.getUUID());
       int flag=collectionService.collection(collection);
       if(flag==1){
           model.addAttribute("result","收藏成功");
       }else{
           model.addAttribute("result","收藏失败");
       }
        //依旧返回图书的详细页面，之返回一些显示添加成功的或者失败的返回信息,这里好像只能用ajax
        return "bookinfo";
    }

    @RequestMapping("/delectcollection")
    public String delectCollection(Model model,HttpServletRequest request){
        String cid=request.getParameter("cid");
        int flag=collectionService.delectCollection(cid);
        if (flag==1){
            model.addAttribute("result","移除成功");
        }else{
            model.addAttribute("result","移除失败");
        }

        //返回到收藏页面,bookcollection应该刷新下,在ajax中应该可以控制.
        return "bookcollection";
    }


}

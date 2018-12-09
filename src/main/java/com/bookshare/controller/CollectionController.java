package com.bookshare.controller;

import com.bookshare.pojo.Book;
import com.bookshare.pojo.CollectionInfo;
import com.bookshare.service.CollectionService;
import com.bookshare.utils.UUIDUtils;
import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

import static com.sun.tools.doclets.formats.html.markup.HtmlStyle.header;

@Controller
public class CollectionController {
    @Autowired
    @Resource
    private CollectionService collectionService;

    /**
     * 展示所有的收藏列表
     *
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/allcollection")
    public String allCollection(Model model, HttpServletRequest request, HttpSession session) {
        /*
        *
        *
        *
        * */
        String cuid = (String) session.getAttribute("uid");
        List<String> bids = collectionService.allbids(cuid);
        String pageNum = request.getParameter("page");
        String pageSize = request.getParameter("size");
        int beginnum = 1;
        int beginsize = 4;
        if (pageNum != null && !"".equals(pageNum)) {
            beginnum = Integer.parseInt(pageNum);
        }
        if (pageSize != null && !"".equals(pageSize)) {
            beginsize = Integer.parseInt(pageSize);
        }
        String sortString = "id.desc";
        Order.formString(sortString);
        PageHelper.startPage(beginnum, beginsize);
        List<Book> books=null;
        if(bids.size()==0){

        }
        else{
            books = collectionService.allBooks(bids);
        }

        PageInfo<Book> pagehelper = new PageInfo<Book>(books);
        model.addAttribute("books", pagehelper.getList());
        model.addAttribute("total", pagehelper.getTotal());
        //System.out.println(pagehelper.getTotal());
        model.addAttribute("pindex", beginnum);
        return "bookcollection";
    }

    /**
     * 点击收藏按钮触发的操作
     */
    @RequestMapping("/collection")
    @ResponseBody
    public int collection(HttpServletRequest request, HttpServletResponse response,HttpSession session) {
        response.setHeader("Access-Control-Allow-Origin", "*");
        CollectionInfo collection = new CollectionInfo();
        String cbid = request.getParameter("cbid");
        //String uid = (String) request.getSession().getAttribute("uid");
        String cuid = (String) session.getAttribute("uid");

        collection.setCbid(cbid);
        collection.setCuid(cuid);
        collection.setCid(UUIDUtils.getUUID());
        int flag = collectionService.collection(collection);
        return flag;
        // return "aa";
    }

    @RequestMapping("/delectcollection")
    @ResponseBody
    public int delectCollection(HttpServletRequest request,HttpSession session) {
        String cbid = request.getParameter("bid");
        //System.out.println(cbid);
        //获得uid
        String cuid= (String) session.getAttribute("uid");
        //System.out.println(cuid);
        int flag = collectionService.delectCollection(cbid,cuid);
        System.out.println(flag);
        return flag;

    }


}

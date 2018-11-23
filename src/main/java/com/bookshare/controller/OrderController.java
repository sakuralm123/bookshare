package com.bookshare.controller;

import com.bookshare.pojo.Order;
import com.bookshare.service.OrderService;
import com.bookshare.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;

    @RequestMapping("/oldorder")
    public String oldOrder(Model model, HttpServletRequest request,HttpSession session){
        String ouid= (String) session.getAttribute("uid");
        List<Order> orders=orderService.oldOrder(ouid);
        model.addAttribute("orders",orders);
        return "orderlistd";
    }

    @RequestMapping("/neworder")
    public String newOrder(Model model, HttpServletRequest request,HttpSession session){
        String ouid= (String) session.getAttribute("uid");
        List<Order> orders=orderService.newOrder(ouid);
        model.addAttribute("orders",orders);
        return "orderlist";
    }

    @RequestMapping("/createorder")
    public String createOrder(HttpServletRequest request, Model model, HttpSession session){
        //System.out.println("在这");
        Order order=new Order();
        String ouid= (String) session.getAttribute("uid");
        if(ouid==null){
            return "login";
        }
        String obuid=request.getParameter("obuid");
        String obprice=request.getParameter("obprice");
        System.out.println(obprice);
        String obpict=request.getParameter("obpict");
        String obname=request.getParameter("obname");
        order.setObuid(obuid);
        order.setOid(UUIDUtils.getUUID());
        order.setOuid(ouid);
        order.setObname(obname);
        order.setObpict(obpict);
        order.setObprice(obprice);
        order.setOstat("3");
        SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
        Date currentTime=new Date();
        String time=formatter.format(currentTime);
        order.setOtime(time);
        int flag=orderService.createOrder(order);
        model.addAttribute("order",order);

        return "orderinfo";
    }

    @RequestMapping("/sureorder")
    public void sureOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String oid=request.getParameter("oid");
        SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
        Date currentTime=new Date();
        String time=formatter.format(currentTime);
        int flag=orderService.sureOrder(oid,time);
        response.sendRedirect("/neworder");
    }

    /**
     *
     * 完成订单
     */
    @RequestMapping("/comorder")
    public void comOrder(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String oid=request.getParameter("oid");
        int flag=orderService.comOrder(oid);
        response.sendRedirect("/neworder");


    }

    @RequestMapping("/befororder")
    public void abc(HttpServletResponse response) throws IOException {
       response.sendRedirect("/neworder");
    }


    @RequestMapping("/befororderd")
    public void acd(HttpServletResponse response) throws IOException {
        response.sendRedirect("/oldorder");

    }

}

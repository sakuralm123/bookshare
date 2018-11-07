package com.bookshare.controller;

import com.bookshare.pojo.Order;
import com.bookshare.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;

    @RequestMapping("/oldorder")
    public String oldOrder(Model model, HttpServletRequest request){
        String ouid= (String) request.getSession().getAttribute("uid");
        List<Order> orders=orderService.oldOrder(ouid);
        model.addAttribute("orders",orders);
        return "oldorder";
    }

    @RequestMapping("/neworder")
    public String newOrder(Model model, HttpServletRequest request){
        String ouid= (String) request.getSession().getAttribute("uid");
        List<Order> orders=orderService.newOrder(ouid);
        model.addAttribute("orders",orders);
        return "oldorder";
    }
}

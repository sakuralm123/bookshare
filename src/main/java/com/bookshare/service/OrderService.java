package com.bookshare.service;

import com.bookshare.pojo.Order;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface OrderService {
    List<Order> oldOrder(String ouid);
    List<Order> newOrder(String ouid);

    int createOrder(Order order);

    int sureOrder(String oid,String time);

    int comOrder(String oid);
}

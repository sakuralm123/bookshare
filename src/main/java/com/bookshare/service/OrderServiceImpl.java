package com.bookshare.service;

import com.bookshare.mapper.OrderMapper;
import com.bookshare.pojo.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService{
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<Order> oldOrder(String ouid) {
        return orderMapper.oldOrder(ouid);
    }

    @Override
    public List<Order> newOrder(String ouid) {
        return orderMapper.newOrder(ouid);
    }
}

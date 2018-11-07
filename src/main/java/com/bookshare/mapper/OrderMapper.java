package com.bookshare.mapper;

import com.bookshare.pojo.Order;

import java.util.List;

public interface OrderMapper {
    List<Order> oldOrder(String ouid);
    List<Order> newOrder(String ouid);
}

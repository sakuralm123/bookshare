package com.bookshare.mapper;

import com.bookshare.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {
    List<Order> oldOrder(String ouid);
    List<Order> newOrder(String ouid);

    int createOrder(Order order);

    int sureOrder(@Param("oid") String oid,@Param("otime") String otime);

    int  comOrder(String oid);
}

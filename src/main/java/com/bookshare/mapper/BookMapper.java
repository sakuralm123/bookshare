package com.bookshare.mapper;

import com.bookshare.pojo.Book;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

@Repository("bookMapper")
public interface BookMapper {
    Book bookInfo(String bid);
}

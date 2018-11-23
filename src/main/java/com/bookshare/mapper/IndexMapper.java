package com.bookshare.mapper;

import com.bookshare.pojo.Book;

import java.util.List;

public interface IndexMapper {
    List<Book>  turnBook();
    List<Book> findBook();
}

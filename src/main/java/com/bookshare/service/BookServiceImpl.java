package com.bookshare.service;

import com.bookshare.mapper.BookMapper;
import com.bookshare.pojo.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookMapper bookMapper;


    @Override
    public Book bookInfo(String bid) {
        return bookMapper.bookInfo(bid);
    }

    @Override
    public int uploadBook(Book book) {
        return bookMapper.uploadBook(book);
    }
}

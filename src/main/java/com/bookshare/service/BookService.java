package com.bookshare.service;

import com.bookshare.pojo.Book;
import org.springframework.stereotype.Service;


@Service
public interface BookService {
    Book bookInfo(String bid);
    int  uploadBook(Book book);
}

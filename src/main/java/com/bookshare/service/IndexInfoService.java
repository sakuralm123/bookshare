package com.bookshare.service;

import com.bookshare.pojo.Book;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface IndexInfoService {
    List<Book> turnBook();
    List<Book> findBook();
}

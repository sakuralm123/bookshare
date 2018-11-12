package com.bookshare.service;

import com.bookshare.pojo.Book;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface BookService {
    Book bookInfo(String bid);
    int  uploadBook(Book book);
    List<Book> fuzzysearch(String bname);
    List<Book> categorysearch(String bcate);
    List<Book> allUpload(String buid);
    int allCount(String bcate);

}

package com.bookshare.service;

import com.bookshare.mapper.BookMapper;
import com.bookshare.pojo.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


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
    @Override
    public List<Book> fuzzysearch(String bname){
        return bookMapper.fuzzysearch(bname);
    }

    @Override
    public List<Book> categorysearch(String bcate) {
        return bookMapper.categorysearch(bcate);
    }

    @Override
    public List<Book> allUpload(String buid) {
        return bookMapper.allUpload(buid);
    }

    @Override
    public int allCount(String bcate) {
        return bookMapper.allCount(bcate);
    }


}

package com.bookshare.service;

import com.bookshare.mapper.IndexMapper;
import com.bookshare.pojo.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IndexInfoServiceImpl implements IndexInfoService{
    @Autowired
    IndexMapper indexMapper;
    @Override
    public List<Book> turnBook() {
        return indexMapper.turnBook();
    }

    @Override
    public List<Book> findBook() {
        return indexMapper.findBook();
    }
}

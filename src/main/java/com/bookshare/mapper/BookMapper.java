package com.bookshare.mapper;

import com.bookshare.pojo.Book;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public interface BookMapper {
    Book bookInfo(String bid);
}

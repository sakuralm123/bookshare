package com.bookshare.mapper;

import com.bookshare.pojo.Book;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("bookMapper")
public interface BookMapper {
    Book bookInfo(String bid);
    int uploadBook(Book book);
    List<Book> fuzzysearch(String bname);
    List<Book> categorysearch(String bcate);
    List<Book> allUpload(String buid);

}

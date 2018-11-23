package com.bookshare.service;

import com.bookshare.pojo.Book;
import com.bookshare.pojo.CollectionInfo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CollectionService {
    List<String> allbids(String buid);
    List<Book> allBooks(List<String> bids);
    int collection(CollectionInfo collection);
    int delectCollection(String bid,String uid);
}

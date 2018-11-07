package com.bookshare.service;

import com.bookshare.pojo.Book;
import com.bookshare.pojo.Collection;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CollectionService {
    List<String> allbids(String buid);
    List<Book> allBooks(List<String> bids);
    int collection(Collection collection);
    int delectCollection(String cid);
}

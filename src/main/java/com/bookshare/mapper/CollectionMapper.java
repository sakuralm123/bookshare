package com.bookshare.mapper;

import com.bookshare.pojo.Book;
import com.bookshare.pojo.Collection;

import java.util.List;

public interface CollectionMapper {
    List<String> allbids(String buid);
    List<Book> allBooks(List<String> bids);
    int collection(Collection collection);
    int delectCollection(String cid);
}

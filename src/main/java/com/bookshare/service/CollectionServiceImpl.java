package com.bookshare.service;

import com.bookshare.mapper.CollectionMapper;
import com.bookshare.pojo.Book;
import com.bookshare.pojo.Collection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class CollectionServiceImpl implements CollectionService{
    @Autowired
    private CollectionMapper collectionMapper;
    @Override
    public List<String> allbids(String buid) {
        return collectionMapper.allbids(buid);
    }

    @Override
    public List<Book> allBooks(List<String> bids) {
        return collectionMapper.allBooks(bids);
    }

    /*
    添加收藏功能
     */
    @Override
    public int collection(Collection collection) {
        return collectionMapper.collection(collection);
    }

    @Override
    public int delectCollection(String cid) {
        return collectionMapper.delectCollection(cid);
    }
}

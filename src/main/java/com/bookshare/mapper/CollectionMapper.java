package com.bookshare.mapper;

import com.bookshare.pojo.Book;
import com.bookshare.pojo.CollectionInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CollectionMapper {
    List<String> allbids(String buid);
    List<Book> allBooks(@Param("bids") List<String> bids);
    int collection(CollectionInfo collection);
    int delectCollection(@Param("cbid") String cbid, @Param("cuid") String cuid);
}

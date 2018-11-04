package com.bookshare.pojo;

/*
 bid VARCHAR(50) NOT NULL COMMENT'主键',
  bname VARCHAR(50) NOT NULL COMMENT '书名',
  bpict VARCHAR(50) NOT NULL COMMENT '图片的地址',
  bdesc VARCHAR(200) COMMENT '书本的描述信息',
  bcate VARCHAR(50) COMMENT '书本的分类',
  bprice VARCHAR(50)NOT NULL COMMENT '书本价格',
  buid VARCHAR(50) NOT NULL COMMENT '图书的所有者',

* */

public class Book {
    private String bid;
    private String bpict;
    private String bname;
    private String bdesc;
    private String bcate;
    private String bprice;
    private String buid;
    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }

    public String getBpict() {
        return bpict;
    }

    public void setBpict(String bpict) {
        this.bpict = bpict;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getBdesc() {
        return bdesc;
    }

    public void setBdesc(String bdesc) {
        this.bdesc = bdesc;
    }

    public String getBcate() {
        return bcate;
    }

    public void setBcate(String bcate) {
        this.bcate = bcate;
    }

    public String getBprice() {
        return bprice;
    }

    public void setBprice(String bprice) {
        this.bprice = bprice;
    }

    public String getBuid() {
        return buid;
    }

    public void setBuid(String buid) {
        this.buid = buid;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bid='" + bid + '\'' +
                ", bpict='" + bpict + '\'' +
                ", bname='" + bname + '\'' +
                ", bdesc='" + bdesc + '\'' +
                ", bcate='" + bcate + '\'' +
                ", bprice='" + bprice + '\'' +
                ", buid='" + buid + '\'' +
                '}';
    }
}

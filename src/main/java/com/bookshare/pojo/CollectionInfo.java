package com.bookshare.pojo;

public class CollectionInfo {
    /*
     cid VARCHAR(50) NOT NULL COMMENT '收藏表的主键',
 cuid VARCHAR(50)NOT NULL COMMENT '收藏者',
 cbid VARCHAR(50) NOT NULL COMMENT '收藏图书的id',
     */
    private String cid;
    private String cuid;
    private String cbid;

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getCuid() {
        return cuid;
    }

    public void setCuid(String cuid) {
        this.cuid = cuid;
    }

    public String getCbid() {
        return cbid;
    }

    public void setCbid(String cbid) {
        this.cbid = cbid;
    }

    @Override
    public String toString() {
        return "Collection{" +
                "cid='" + cid + '\'' +
                ", cuid='" + cuid + '\'' +
                ", cbid='" + cbid + '\'' +
                '}';
    }
}

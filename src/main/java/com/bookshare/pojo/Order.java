package com.bookshare.pojo;

public class Order {
    /*
    CREATE TABLE orders(
  oid VARCHAR(50) NOT NULL COMMENT '订单表主键',
  ouid VARCHAR(50) NOT NULL COMMENT '图书所有者id',
  obid VARCHAR(50) NOT NULL COMMENT '图书id',
  obprice VARCHAR(50) NOT NULL COMMENT '图书价格',
  otime VARCHAR(50) NOT NULL COMMENT '成交时间',
  ostat VARCHAR(10) NOT NULL COMMENT '订单状态',
  PRIMARY KEY(oid),
  CONSTRAINT FK_ouid FOREIGN KEY(ouid) REFERENCES USER(uid),
  CONSTRAINT FK_obid FOREIGN KEY(obid) REFERENCES book(bid)


     */
    private String oid;
    private String ouid;
    private String obuid;
    private String obprice;
    private String otime;
    private String ostat;
    private String obpict;
    private String obname;


    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public String getOuid() {
        return ouid;
    }

    public void setOuid(String ouid) {
        this.ouid = ouid;
    }

    public String getObuid() {
        return obuid;
    }

    public void setObuid(String obuid) {
        this.obuid = obuid;
    }

    public String getObprice() {
        return obprice;
    }

    public void setObprice(String obprice) {
        this.obprice = obprice;
    }

    public String getOtime() {
        return otime;
    }

    public void setOtime(String otime) {
        this.otime = otime;
    }

    public String getOstat() {
        return ostat;
    }

    public void setOstat(String ostat) {
        this.ostat = ostat;
    }

    public String getObpict() {
        return obpict;
    }

    public void setObpict(String obpict) {
        this.obpict = obpict;
    }

    public String getObname() {
        return obname;
    }

    public void setObname(String obname) {
        this.obname = obname;
    }

    @Override
    public String toString() {
        return "Order{" +
                "oid='" + oid + '\'' +
                ", ouid='" + ouid + '\'' +
                ", obuid='" + obuid + '\'' +
                ", obprice='" + obprice + '\'' +
                ", otime='" + otime + '\'' +
                ", ostat='" + ostat + '\'' +
                ", obpict='" + obpict + '\'' +
                ", obname='" + obname + '\'' +
                '}';
    }
}

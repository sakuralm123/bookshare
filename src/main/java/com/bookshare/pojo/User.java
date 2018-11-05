package com.bookshare.pojo;

public class User implements PackageObject{
    /*
     * uid VARCHAR(50) NOT NULL COMMENT'主键',
     uconn VARCHAR(50) NOT NULL COMMENT'联系方式',
     uname VARCHAR(50) NOT NULL COMMENT '昵称',
     uage VARCHAR(50) COMMENT '年龄',
     usex VARCHAR(50) COMMENT '性别',
     uvavat VARCHAR(50) COMMENT'头像',
     ucolle VARCHAR(50) COMMENT'收藏',
     * @param name
     * @param value
     */

    private String uid;
    private String uconn;
    private String uname;
    private String uage;
    private String usex;
    private String uvavat;
    private String ucolle;

    public String getUpass() {
        return upass;
    }

    public void setUpass(String upass) {
        this.upass = upass;
    }

    private String upass;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUconn() {
        return uconn;
    }

    public void setUconn(String uconn) {
        this.uconn = uconn;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUage() {
        return uage;
    }

    public void setUage(String uage) {
        this.uage = uage;
    }

    public String getUsex() {
        return usex;
    }

    public void setUsex(String usex) {
        this.usex = usex;
    }

    public String getUvavat() {
        return uvavat;
    }

    public void setUvavat(String uvavat) {
        this.uvavat = uvavat;
    }

    public String getUcolle() {
        return ucolle;
    }

    public void setUcolle(String ucolle) {
        this.ucolle = ucolle;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid='" + uid + '\'' +
                ", uconn='" + uconn + '\'' +
                ", uname='" + uname + '\'' +
                ", uage='" + uage + '\'' +
                ", usex='" + usex + '\'' +
                ", uvavat='" + uvavat + '\'' +
                ", ucolle='" + ucolle + '\'' +
                '}';
    }

    @Override
    public void packageObject(String name, String value) {
        if(name!=null&&name!=""){
            if (name.equals("uname")){
                this.setUname(value);
            }else if (name.equals("uage")){
                this.setUage(value);
            }else if (name.equals("usex")){
                this.setUsex(value);
            }else if (name.equals("uvavat")){
                this.setUvavat(value);
            }else if (name.equals("uconn")){
                this.setUconn(value);
            }
        }

    }
}

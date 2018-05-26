package com.erdong.warehouse.pojo;

public class Role {
     private long id;
      private String name;
      private String code;
      private String remark;
      private String gtmCreate;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getGtmCreate() {
        return gtmCreate;
    }

    public void setGtmCreate(String gtmCreate) {
        this.gtmCreate = gtmCreate;
    }
}

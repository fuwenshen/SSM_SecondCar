package com.base;

/**
 * Created by FWS on 2018/3/21.
 */
public class BasicRespMessage {
    int status;
    String desc="";
    Object body=null;

    public BasicRespMessage() {
    }

    public BasicRespMessage(int status) {
        this.status = status;
    }

    public BasicRespMessage(int status, String desc) {
        this.status = status;
        this.desc = desc;
    }

    public BasicRespMessage autoFilled(int status){
        this.status =status;
        return this;
    }

    public BasicRespMessage autoFilled(int status,String desc){
        this.status =status;
        this.desc=desc;
        return this;
    }

    public int getStatus() {
        return status;
    }

    public String getDesc() {
        return desc;
    }

    public Object getBody() {
        return body;
    }

    public void setBody(Object body) {
        this.body = body;
    }
}

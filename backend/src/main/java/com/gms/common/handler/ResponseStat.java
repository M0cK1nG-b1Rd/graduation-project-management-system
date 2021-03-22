package com.gms.common.handler;

public enum ResponseStat {
    SUCCESS("success"),
    ERROR("error");
    private final String text;
    ResponseStat(String text){
        this.text=text;
    }
    public String getText() {
        return text;
    }
}

package com.gms.common.domain;

import java.util.HashMap;

public class GmsResponse extends HashMap<String, Object> {

    private static final long serialVersionUID = -8713837118340960775L;

    public GmsResponse message(String message) {
        this.put("message", message);
        return this;
    }

    public GmsResponse code(String code) {
        this.put("code", code);
        return this;
    }

    public GmsResponse status(String status) {
        this.put("status", status);
        return this;
    }

    public GmsResponse data(Object data) {
        this.put("data", data);
        return this;
    }

    @Override
    public GmsResponse put(String key, Object value) {
        super.put(key, value);
        return this;
    }

    public GmsResponse addCodeMessage(Integer code,String message,String status,Object data) {
        this.put("code", code);
        this.put("message", message);
        this.put("status", status);
        this.put("data", data);
        return this;
    }

    public GmsResponse addCodeMessage(Integer code,String message,String status) {
        this.put("code", code);
        this.put("message", message);
        this.put("status", status);
        return this;
    }
}

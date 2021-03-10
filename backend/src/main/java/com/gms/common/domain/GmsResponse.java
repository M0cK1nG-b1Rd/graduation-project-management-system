package com.gms.common.domain;

import java.util.HashMap;

public class GmsResponse extends HashMap<String, Object> {


    public GmsResponse meta(Meta meta) {
        this.put("meta", meta);
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

    public GmsResponse addCodeMessage(Meta meta,Object data) {
        this.put("meta", meta);
        this.put("data", data);
        return this;
    }

    public GmsResponse addCodeMessage(Meta meta) {
        this.put("meta", meta);
        return this;
    }
}

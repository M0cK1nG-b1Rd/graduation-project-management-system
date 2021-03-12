package com.gms.gms.utils;

import java.util.UUID;

public class FileStorageUtils {

    /**
     * 生成FILE_ID作为主键
     * @return
     */
    public static String getDocId(){
        return UUID.randomUUID().toString().replace("-", "");
    }

}

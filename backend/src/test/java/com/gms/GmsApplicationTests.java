package com.gms;

import com.gms.gms.utils.FileStorageUtil;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class GmsApplicationTests {

    @Test
    void contextLoads() {
        String uuid = FileStorageUtil.getDocId();
        System.out.println(uuid);
    }

}

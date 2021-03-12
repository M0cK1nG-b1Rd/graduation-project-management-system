package com.gms;

import com.gms.gms.utils.FileStorageUtils;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.UUID;

@SpringBootTest
@Slf4j
class GmsApplicationTests {

    @Test
    void contextLoads() {
        String uuid =FileStorageUtils.getDocId();
        System.out.println(uuid);
    }

}

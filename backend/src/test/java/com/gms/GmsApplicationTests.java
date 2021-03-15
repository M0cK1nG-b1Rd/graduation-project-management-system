package com.gms;

import com.gms.gms.dao.AccountMapper;
import com.gms.gms.domain.TeacherTeam;
import com.gms.gms.utils.FileStorageUtil;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class GmsApplicationTests {

    @Autowired
    AccountMapper mapper;

    @Test
    void contextLoads() {
        mapper.addTeacherTeamMember(2,1,false);
        System.out.println();
    }

}

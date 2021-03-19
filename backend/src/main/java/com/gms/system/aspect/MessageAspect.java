package com.gms.system.aspect;

import com.alibaba.fastjson.JSONObject;
import com.gms.system.utils.CreatNewMessage;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Slf4j
@Aspect
@Component
public class MessageAspect {

    @AfterReturning(value = "execution(* com.gms.gms.controller.PleaController.updatePleaReleaseTure(com.alibaba.fastjson.JSONObject)) && args(jsonObject)",argNames = "jsonObject")
    public void afterUpdatePleaReleaseTure(JSONObject jsonObject) {
        new CreatNewMessage().creatNewPleaOne(jsonObject.getString("stage"));
    }

    @AfterReturning(value = "execution(* com.gms.gms.controller.PleaController.updatePleaReleaseFalse(com.alibaba.fastjson.JSONObject)) && args(jsonObject)",argNames = "jsonObject")
    public void afterUpdatePleaReleaseFalse(JSONObject jsonObject) {
        new CreatNewMessage().creatNewPleaTwo(jsonObject.getString("stage"));
    }

    @AfterReturning(value = "execution(* com.gms.gms.controller.PleaController.deletePleaRelease(java.lang.String)) && args(stage)",argNames = "stage")
    public void afterUpdatePleaReleaseFalse(String stage) {
        new CreatNewMessage().creatNewPleaTwo(stage);
    }
}

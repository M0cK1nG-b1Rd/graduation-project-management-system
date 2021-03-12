package com.gms.gms.exception;

import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.code.Code;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

/**
 * @ClassName FileUploadExceptionAdvice
 * @Description TODO
 * @Author 树下魅狐
 * @Date 2020/4/28 0028 19:10
 * @Version since 1.0
 **/
@ControllerAdvice
public class FileStorageException extends ResponseEntityExceptionHandler {

    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public GmsResponse handleMaxUploadSizeExceededException(MaxUploadSizeExceededException e){
        return new GmsResponse().addCodeMessage(new Meta(
                Code.C400.getCode(),
                Code.C400.getDesc(),
                "文件过大！" ));
    }
}
